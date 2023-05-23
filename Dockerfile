FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime

# ENV scripts
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /root/.mujoco/mujoco210/bin:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /opt/conda/pkgs/cudatoolkit-11.1.74-h6bb024c_0/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /opt/conda/lib:$LD_LIBRARY_PATH
ENV TF_ENABLE_ONEDNN_OPTS 1

# RUN scripts
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y dstat
RUN apt-get install -y --reinstall build-essential
RUN pip install tensorboard
RUN pip install torch_tb_profiler
RUN pip install timm
RUN pip install tensorboard-logger
RUN pip install tensorflow
RUN pip install networkx
RUN pip install pyemd
RUN pip install matplotlib
RUN pip install sklearn
RUN pip install community
RUN pip install future
RUN pip install numpy
RUN pip install onnx
RUN pip install pydot
RUN pip install torch
RUN pip install torchviz
RUN pip install scikit-learn
RUN pip install tqdm
RUN pip install gym[atari] autorom[accept-rom-license]
RUN pip install "ray[rllib]" torch "gym[atari]" "gym[accept-rom-license]" atari_py
RUN pip install pybullet
RUN pip install mujoco-py
RUN pip install gym==0.15.3
RUN apt-get install -y libosmesa6-dev
RUN apt install -y mesa-common-dev libglu1-mesa-dev
RUN apt-get install patchelf
RUN apt-get install -y wget
RUN wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz && tar -zxvf mujoco210-linux-x86_64.tar.gz \ 
    && mkdir /root/.mujoco && mv mujoco210 /root/.mujoco/mujoco210 \ 
    && pip install -U 'mujoco-py<2.2,>=2.1'  
RUN python -c "import mujoco_py;"
RUN rm -rf mujoco210-linux-x86_64.tar.gz
RUN pip install deepctr-torch
RUN pip install pandas
RUN pip install seaborn
RUN pip install fastBPE sacremoses fairseq
RUN pip install datasets transformers
RUN git clone https://github.com/mlperf/logging.git mlperf-logging && pip install -e mlperf-logging
RUN rm -rf mlperf-logging
RUN pip install soundfile
RUN apt-get install libsndfile1 -y
RUN pip install tables
RUN apt-get install net-tools
WORKDIR /mnt/code