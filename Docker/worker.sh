#!/bin/bash

# Worker setup script for CPU
# Author: Prashant Jalan

echo "Pulling the image and starting worker server for CPU"
wget -P ./Celery/ http://dl.caffe.berkeleyvision.org/bvlc_reference_caffenet.caffemodel
sudo docker build -t cloudcv/worker-cpu ./Celery/
sudo docker run -d --volumes-from cloudcv_code --link cloudcv_redis:redis --name cloudcv_worker_cpu cloudcv/worker-cpu
rm ./Celery/bvlc_reference_caffenet.caffemodel
