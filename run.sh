#!/bin/sh

docker run --gpus all --shm-size=18g --ulimit memlock=-1 --ulimit stack=67108864 -it --rm -p 8888:8888 -p 6006:6006 -v /home/enzo/TensorFlow/Notebook:/workspace/Notebook  -v /home/enzo/data:/data idea:TensorFlow-2.4
