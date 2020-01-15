export TENSORFLOWPATH=${PWD}
cd ObjectDetectionDeps
export PYTHONPATH=$PYTHONPATH:${PWD}:${PWD}/slim
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

