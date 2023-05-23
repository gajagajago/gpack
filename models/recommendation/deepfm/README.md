# DeepFM

Train on 32747463 samples, validate on 3638607 samples, 327475 steps per epoch (batch size 100)

## 1. How to run
Run `main.py` with one command line argument, indicating the file to log 'batch time' on every `step_end`. The file will contain seconds/batch. 
```
python main.py $file
```

## 2. References
[[Deep Learning] [논문 코드 구현] Deep FM : A Factorization-Machine based Neural Network for CTR Prediction (deepctr-torch 사용하기! )](https://huidea.tistory.com/282)

