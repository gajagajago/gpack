import torch

import torch
import torch.nn as nn
from deepctr_torch.models.basemodel import BaseModel
from deepctr_torch.inputs import combined_dnn_input
from deepctr_torch.layers import FM, DNN
import time

class DeepFM(BaseModel):
    """Instantiates the DeepFM Network architecture.
    :param linear_feature_columns: An iterable containing all the features used by linear part of the model. (-> FM에 들어갈 피쳐, 전체 피쳐)
    
    :param dnn_feature_columns: An iterable containing all the features used by deep part of the model. (-> DNN에 들어갈 피쳐, 전체 피쳐)  
    :param use_fm: bool,use FM part or not (FM 사용할지 말지)
    
    :param dnn_hidden_units: list,list of positive integer or empty list, 
       the layer number and units in each layer of DNN (-> DNN 모델 layer 개수 - default 256, 128)
    :param dnn_dropout: float in [0,1), the probability we will drop out a given DNN coordinate.(->딥러닝 dropout)
    :param dnn_activation: Activation function to use in DNN (-> 딥러닝 활성함수) 
    :param dnn_use_bn: bool. Whether use BatchNormalization before activation or not in DNN (->딥러닝 배치norm)
    

    :param l2_reg_linear: float. L2 regularizer strength applied to linear part (-> FM l2 정규화 정도, defalut 1e-5) 
    :param l2_reg_embedding: float. L2 regularizer strength applied to embedding vector (-> embedding l2 정규화 정도, defalut 1e-5) 
    :param l2_reg_dnn: float. L2 regularizer strength applied to DNN (-> dnn l2 정규화 정도, defalut 1e-5) 
    
    :param init_std: float,to use as the initialize std of embedding vector (-> 임베딩 초기 표준편차)
    :param seed: integer ,to use as random seed. (-> 랜덤시드)

    :param task: str, ``"binary"`` for  binary logloss or  ``"regression"`` for regression loss (->태스크 - 이진분류 / 회귀)
    :param device: str, ``"cpu"`` or ``"cuda:0"`` (->cpu, gpu 선택)
    :param gpus: list of int or torch.device for multiple gpus. If None, run on `device`. `gpus[0]` should be the same gpu with `device`.
    
    :param batchtime_log: opened file to log batch time
    
    :return: A PyTorch model instance.
    """

    def __init__(self,
                 linear_feature_columns, dnn_feature_columns, batchtime_log_path, use_fm=True,
                 dnn_hidden_units=(256, 128),
                 l2_reg_linear=0.00001, l2_reg_embedding=0.00001, l2_reg_dnn=0, init_std=0.0001, seed=1024,
                 dnn_dropout=0,
                 dnn_activation='relu', dnn_use_bn=False, task='binary', device='cpu', gpus=None):

        super(DeepFM, self).__init__(linear_feature_columns, dnn_feature_columns, l2_reg_linear=l2_reg_linear,
                                     l2_reg_embedding=l2_reg_embedding, init_std=init_std, seed=seed, task=task,
                                     device=device, gpus=gpus)

        self.use_fm = use_fm
        self.use_dnn = len(dnn_feature_columns) > 0 and len(
            dnn_hidden_units) > 0
        
        if use_fm: ### FM model 로딩
            self.fm = FM()

        if self.use_dnn: ### dnn part 에서 쓰일 모델들 선언 
            self.dnn = DNN(self.compute_input_dim(dnn_feature_columns), dnn_hidden_units,
                           activation=dnn_activation, l2_reg=l2_reg_dnn, dropout_rate=dnn_dropout, use_bn=dnn_use_bn,
                           init_std=init_std, device=device)
            self.dnn_linear = nn.Linear(
                dnn_hidden_units[-1], 1, bias=False).to(device)

            self.add_regularization_weight(
                filter(lambda x: 'weight' in x[0] and 'bn' not in x[0], self.dnn.named_parameters()), l2=l2_reg_dnn)
            self.add_regularization_weight(self.dnn_linear.weight, l2=l2_reg_dnn)
        self.to(device)

        # For logging purposes
        self.batchtime_log = open(batchtime_log_path, "w+")
        self.last_end_time = None

    def forward(self, X): ### 학습 
        sparse_embedding_list, dense_value_list = self.input_from_feature_columns(X, self.dnn_feature_columns,
                                                                                  self.embedding_dict)
        ## 1) FM 연산 
        ### 1.1) 선형 모델 통과 
        logit = self.linear_model(X) ## 결과값 추가 
        
        ### 1.2) fm 연산 (칼럼끼리 곱)
        if self.use_fm and len(sparse_embedding_list) > 0: 
            fm_input = torch.cat(sparse_embedding_list, dim=1)
            logit += self.fm(fm_input) ## 결과값 추가 

        ## 2) DNN 학습 
        if self.use_dnn: 
            dnn_input = combined_dnn_input(
                sparse_embedding_list, dense_value_list) 
            dnn_output = self.dnn(dnn_input)
            dnn_logit = self.dnn_linear(dnn_output)
            logit += dnn_logit ## 결과값 추가 

        y_pred = self.out(logit)

        ##
        torch.cuda.synchronize()
        batch_end_time = time.time()
        ##
        
        torch.cuda.synchronize()
        batch_end_time = time.time()

        if self.last_end_time is not None:
            batchtime = batch_end_time - self.last_end_time 
            self.batchtime_log.write(str(batchtime)+"\n")
                    
        self.last_end_time = batch_end_time

        return y_pred