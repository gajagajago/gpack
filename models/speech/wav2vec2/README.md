# Wav2Vec2.0

## 1. How to install
$ext should be set to flac, wav, or whatever format your dataset happens to use that soundfile can read.

$valid should be set to some reasonable percentage (like 0.01) of training data to use for validation. To use a pre-defined validation set (like dev-other from librispeech), set to it 0 and then overwrite valid.tsv with a separately pre-processed manifest file.

[LibriSpeech train-clean-100 datasets](http://www.openslr.org/12) are used.

```
python wav2vec_manifest.py /path/to/waves --dest /manifest/path --ext $ext --valid-percent $valid
```

For example, I ran this script inside the docker container. 
```
python wav2vec_manifest.py /mnt/data/wav2vec2_data/LibriSpeech --dest /mnt/data/wav2vec2_data/data/ --ext flac --valid-percent 0.01
```

# 2. How to run
```
fairseq-hydra-train \
    +task.data=$data_path \
    +common.log_file=$log_file \
    --config-dir ./config/pretraining \ 
    --config-name wav2vec2_base_librispeech 
```
`data_path`: Path to the sound data files. We give the following path: `/mnt/data/wav2vec2_data/data`
`log_file`: Path to log file, which saves train logs every step.

# 3. References 
https://github.com/facebookresearch/fairseq/tree/main/examples/wav2vec