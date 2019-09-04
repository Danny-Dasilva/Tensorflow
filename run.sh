
#workon objectDetection
export TENSORFLOWPATH=${PWD}
echo ${TENSORFLOWPATH}

cd ObjectDetectionDeps
export PYTHONPATH=$PYTHONPATH:${PWD}:${PWD}/slim
echo ${PYTHONPATH}

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
cd ..
cd put_files_here
export IMAGEWORKDIR=${PWD}
cd Images
export IMAGEPATH=${PWD}
cd Train
export TRAININGPATH=${PWD}
cd ..

cd Test
export TESTINGPATH=${PWD}
cd ..
cd ..

cd Model

export MODEL_DIR=${PWD}
cd ..
cd ..
