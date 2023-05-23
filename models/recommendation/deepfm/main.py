import os
import gzip
import shutil
import glob
import sys

import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.metrics import log_loss, roc_auc_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler

import torch
from deepctr_torch.inputs import SparseFeat, DenseFeat, get_feature_names
from tensorflow.keras.callbacks import LambdaCallback 
from tensorflow.python.distribute import mirrored_strategy, cross_device_ops
import tensorflow as tf

import loader
from deepfm import DeepFM

import argparse

parser = argparse.ArgumentParser(description='Training Config')

parser.add_argument('--outfile',
                    help='path to log training outputs')
parser.add_argument('--num_gpus', type=int, default=1,
                    help='number of gpus included in the training')

args = parser.parse_args()

def feature_selection(data):
    print("\n\n2. feature selection ")

    sparse_features = data.columns.tolist()
    sparse_features.remove('click')
    sparse_features.remove('hour')
    dense_features = ['hour']

    print("sparse feature :", sparse_features)
    print("dense feature :", dense_features)
    print("target :", 'click')

    return data, sparse_features, dense_features

def feature_encoding(data, sparse_features, dense_features):

    print("\n\n3-1. feature encoding ")
    print("categorical value to numeric label")
    for feat in sparse_features:
        lbe = LabelEncoder()
        data[feat] = lbe.fit_transform(data[feat])

    print("numeric value Minmax scaling ")
    mms = MinMaxScaler(feature_range=(0, 1)) ### date 더 최근일 수록 더 큰 숫자가 입력됨 
    data[dense_features] = mms.fit_transform(data[dense_features])

    return data

def feature_format_deepfm(data, sparse_features, dense_features, embedding_dim):

    print(f"\n\n3-2. feature embedding - embedding size {embedding_dim}")
    spar_feat_list = [SparseFeat(feat, vocabulary_size=data[feat].max() + 1, embedding_dim=embedding_dim) for i, feat in enumerate(sparse_features)]
    dense_feat_list = [DenseFeat(feat, 1, ) for feat in dense_features]
    fixlen_feature_columns = spar_feat_list + dense_feat_list

    dnn_feature_columns = fixlen_feature_columns
    linear_feature_columns = fixlen_feature_columns
    feature_names = get_feature_names(linear_feature_columns + dnn_feature_columns)

    return dnn_feature_columns, linear_feature_columns, feature_names

def data_split(data, test_rato, feature_names, random_seed):
    print(f"\n\n4. data split (test ratio - {test_rato})")
    train, test = train_test_split(data, test_size=test_rato, random_state = random_seed)
    train_model_input = {name: train[name] for name in feature_names}
    test_model_input = {name: test[name] for name in feature_names}

    return train, test, train_model_input, test_model_input 

def modeling(linear_feature_columns, dnn_feature_columns,
             batch_size, num_epoch, val_ratio, test_rato, l2_decay_val, random_seed, batchtime_log_path):
    
    print(f"\n\n5. Modeling")
    model = DeepFM(linear_feature_columns=linear_feature_columns,  
               dnn_feature_columns=dnn_feature_columns, 
               l2_reg_linear=l2_decay_val, l2_reg_embedding=l2_decay_val, l2_reg_dnn=l2_decay_val,
               dnn_dropout=0.5, 
               dnn_use_bn = True,
               dnn_hidden_units=(32, 16),
               task='binary',
               seed=random_seed, device=device, batchtime_log_path=batchtime_log_path)

    model.compile("adam", "binary_crossentropy", 
                metrics=["binary_crossentropy", "auc"], )

    return model

def eval_test(model, test_model_input, batch_size ):
    print(f"\n\n6. Evaluation testset")
    pred_ans = model.predict(test_model_input, batch_size) #batch_size default : 256
    print("")
    print("test LogLoss", round(log_loss(test[target].values, pred_ans), 4))
    print("test AUC", round(roc_auc_score(test[target].values, pred_ans), 4))


if __name__ == "__main__":
    batch_size = 1000 
    num_epoch = 10**6
    val_ratio = 0.1
    test_rato = 0.1
    random_seed = 2022
    l2_decay_val = 1e-01
    embedding_dim = 5

    batchtime_log_path = args.outfile

    if batchtime_log_path is None:
        print("Invalid batchtime log path")
        exit()

    device = "cpu"
    use_cuda = True
    if use_cuda and torch.cuda.is_available():
        print('cuda ready...')
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


    data = loader.data_load()
    target = ['click']

    data, sparse_features, dense_features = feature_selection(data)
    data = feature_encoding(data, sparse_features, dense_features)

    dnn_feature_columns, linear_feature_columns, feature_names = feature_format_deepfm(data, sparse_features, dense_features, embedding_dim)

    train, test, train_model_input, test_model_input = data_split(data, test_rato, 
                                                                  feature_names, random_seed)

    strategy = mirrored_strategy.MirroredStrategy(
        [f"GPU:{idx}" for idx in range(args.num_gpus)],
        cross_device_ops.NcclAllReduce(args.num_gpus)
    )
    print(f'Start training with {strategy.num_replicas_in_sync} gpus')

    with strategy.scope():
        model = modeling(linear_feature_columns, dnn_feature_columns,
                batch_size, num_epoch, val_ratio, test_rato, l2_decay_val, random_seed, batchtime_log_path)
    
    model.fit(
        train_model_input, 
        train[target].values,
        batch_size=batch_size, 
        epochs=num_epoch, 
        verbose=2, 
        validation_split=val_ratio)
    
    # eval_test(model, test_model_input, batch_size)