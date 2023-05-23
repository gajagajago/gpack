# Data2Vec

## 1. How to install
Follow instructions in [wav2vec_how_to_install](../wav2vec2/README.md). Same [LibriSpeech train-clean-100 datasets](http://www.openslr.org/12) are used.

(Updated) LibriSpeech train-clean-100 datasets caused CUDA OOM too much for MPS experiments. Switched to dev-clean datasets.

# 2. How to run
```
fairseq-hydra-train \
    +task.data=$data_path \
    +common.log_file=$log_file \
    --config-dir ./config/pretraining \ 
    --config-name wav2vec2_base_librispeech 
```

```
cd ../fairseq
python fairseq_cli/hydra_train.py -m \
    --config-dir /mnt/code/profiler/speech/data2vec/config/audio/pretraining \
    --config-name base_librispeech \
    task.data=$data_path \
    common.log_file=$log_file \
    common.user_dir=examples/data2vec
```

`data_path`: Path to the sound data files. We give the following path: `/mnt/data/wav2vec2_data/data`
`log_file`: Path to log file, which saves train logs every step.

# 3. References
https://github.com/facebookresearch/fairseq/tree/main/examples/data2vec