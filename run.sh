
#workon objectDetection
export TENSORFLOWPATH=${PWD}
echo ${TENSORFLOWPATH}

cd ObjectDetectionDeps
export PYTHONPATH=$PYTHONPATH:${PWD}:${PWD}/slim
echo ${PYTHONPATH}

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
cd ..