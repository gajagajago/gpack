# Transformer

Training a transformer LM with [WikiText-103 dataset](https://www.salesforce.com/products/einstein/ai-research/the-wikitext-dependency-language-modeling-dataset/)

## 1. How to run
WikiText-103 dataset is downloaded in `/mnt/data/transformer_data`, and the preprocessing is already done by running `./preprocess.sh`. 
Start training by running following command. Command line argument `$file` indicates where to log the output.  
```
./train.sh $file
``` 

## 2. How to interpret log
For each iteration, words per second(wps) and words per batch(wpd) is logged. To get s/batch, calculate 1/wps * wpb.

## 3. References
https://github.com/facebookresearch/fairseq/tree/main/examples/language_model
