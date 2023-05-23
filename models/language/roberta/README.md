# Transformer

Training RoBERTa with [WikiText-103 dataset](https://www.salesforce.com/products/einstein/ai-research/the-wikitext-dependency-language-modeling-dataset/)

## 1. How to run
WikiText-103 dataset is downloaded in `/mnt/data/roberta_data`, and the preprocessing is already done. Refer to `/scripts/one_gpu/run_roberta.sh` and ``/scripts/multi_gpu/run_roberta.sh``

## 2. How to interpret log
For each iteration, words per second(wps) and words per batch(wpd) is logged. To get s/batch, calculate 1/wps * wpb.

## 3. References
https://github.com/facebookresearch/fairseq/tree/main/examples/roberta