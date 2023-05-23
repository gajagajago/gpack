from config import DATA_PATH

import pandas as pd

def data_load():
    print("\n\n1. data load ")
    data_path = DATA_PATH
    data = pd.read_csv(data_path + "train")
    print(data.head(3))
    # print(data.columns)
    # print(data.shape) 
    
    return data