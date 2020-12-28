#FROM nvidia/cuda:11.1-base-ubuntu20.04
FROM nvidia/cuda:11.0-base-ubuntu20.04

RUN apt-get update && yes | apt-get upgrade
RUN DEBIAN_FRONTEND=noninteractive apt -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt -y install wget

RUN apt-get -y install libcublas-11-0
RUN apt-get -y install libcufft-11-0
RUN apt-get -y install libcurand-11-0
RUN apt-get -y install libcurand-11-0
RUN apt-get -y install libcusolver-11-0
RUN apt-get -y install libcusparse-11-0
#RUN apt-get -y install libcudnn8


#https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.0.5.39-1+cuda11.0_amd64.deb
#https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcublas-11-0_11.2.0.252-1_amd64.deb

#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcublas-11-1_11.3.0.106-1_amd64.deb
#RUN apt -y install ./libcublas-11-1_11.3.0.106-1_amd64.deb
#RUN rm libcublas-11-1_11.3.0.106-1_amd64.deb
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcufft-11-1_10.3.0.105-1_amd64.deb
#RUN apt -y install ./libcufft-11-1_10.3.0.105-1_amd64.deb
#RUN rm libcufft-11-1_10.3.0.105-1_amd64.deb
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcurand-11-1_10.2.2.105-1_amd64.deb
#RUN apt -y install ./libcurand-11-1_10.2.2.105-1_amd64.deb
#RUN rm libcurand-11-1_10.2.2.105-1_amd64.deb
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcusolver-11-0_10.6.0.245-1_amd64.deb
#RUN apt -y install ./libcusolver-11-0_10.6.0.245-1_amd64.deb
#RUN rm libcusolver-11-0_10.6.0.245-1_amd64.deb
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcusparse-11-1_11.3.0.10-1_amd64.deb
#RUN apt -y install ./libcusparse-11-1_11.3.0.10-1_amd64.deb
#RUN rm libcusparse-11-1_11.3.0.10-1_amd64.deb
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb
#RUN apt -y install ./libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb
#RUN rm libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb

RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer7_7.2.1-1+cuda11.0_amd64.deb
RUN apt -y install ./libnvinfer7_7.2.1-1+cuda11.0_amd64.deb
RUN rm libnvinfer7_7.2.1-1+cuda11.0_amd64.deb
RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-dev_7.2.1-1+cuda11.0_amd64.deb
RUN apt -y install ./libnvinfer-dev_7.2.1-1+cuda11.0_amd64.deb
RUN rm libnvinfer-dev_7.2.1-1+cuda11.0_amd64.deb
RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-plugin7_7.2.1-1+cuda11.0_amd64.deb
RUN apt -y install ./libnvinfer-plugin7_7.2.1-1+cuda11.0_amd64.deb
RUN rm libnvinfer-plugin7_7.2.1-1+cuda11.0_amd64.deb
RUN apt -y remove libcudnn8
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.0.5.39-1+cuda11.0_amd64.deb
#RUN dpkg -i ./libcudnn8_8.0.5.39-1+cuda11.0_amd64.deb
#RUN apt-get install -f
RUN apt -y install ./libcudnn8_8.0.5.39-1+cuda11.0_amd64.deb
RUN rm libcudnn8_8.0.5.39-1+cuda11.0_amd64.deb


RUN DEBIAN_FRONTEND=noninteractive apt -y install python3
RUN DEBIAN_FRONTEND=noninteractive apt -y install python3-pip
#RUN ln -s /usr/local/cuda-11.1 /usr/local/nvidia/
#RUN ln -s /usr/local/cuda-11.0/lib64/libcusolver.so.10 /usr/local/cuda/lib64/libcusolver.so.10
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install tensorflow-gpu
RUN pip install tensorboard
RUN pip install keras
RUN pip install jupyterlab
RUN pip install notebook
#RUN jupyter serverextension enable --py jupyterlab --sys-prefix
#RUN mkdir -p /tensorflow/models
RUN pip install jupyter
RUN pip install install jupyter-tensorboard
RUN pip install matplotlib
COPY ./config/jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888
EXPOSE 6006
#CMD jupyter notebook --allow-root --port=8888 --no-browser --ip=0.0.0.0 &
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
#CMD ["tensorboard", "serve", "--logdir=/tf_logs"]
CMD ["bash"]

