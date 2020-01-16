
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


/tensorflow/models/research/learn_pet

cp -r /tensorflow/models/research/learn_pet/put_files_here/ /root/Tensorflow_Object_Detection


python3-pip
pip3 install pandas

pillow
tensorflow gpu
matplotlib



scikit-image
cython 
apt-get install python3.6-dev 
pip3 pycocotools

cp /root/Tensorflow_Object_Detection/ObjectDetectionDeps/Generate_Labelmap.py ${PWD}


docker run -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 nvidia/cuda

docker run --name edgetpu-detect \ -ti --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 nvidia/cuda



docker run --name edgetpu-detect \
--rm -it --privileged -p 6006:6006 \
--mount type=bind,src=${DETECT_DIR},dst=/tensorflow/models/research/learn_pet \
detect-tutorial
