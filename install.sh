pip3 install virtualenv
mkvirutalenv objectDetection
workon objectDetection
sudo apt --purge autoremove nvidia* -y
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update -y
sudo apt upgrade -y
sudo apt install nvidia-driver-418 -y
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev -y
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux
sudo sh cuda_10.0.130_410.48_linux
sudo bash -c "echo /usr/local/cuda/lib64/ > /etc/ld.so.conf.d/cuda.conf"
sudo ldconfig
export PATH=${PATH}:/usr/local/cuda/bin
echo "Navigate to this URL and download cuDNN for CUDA 10.0\n"
echo "https://developer.nvidia.com/rdp/cudnn-download\n"

read -p 'Paste the name of the cuDNN tgz file with the tgz extension: ' cdn
echo
echo $cdn
read -p "Is this filename correct (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

cd Downloads
tar -xzvf $cdn cuda/
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
pip3 install tensorflow-gpu
sudo apt-get install protobuf-compiler python-pil python-lxml python-tk
pip3 install Cython
pip3 install contextlib2
pip3 install jupyter
pip3 install matplotlib
pip3 install pillow
pip3 install pandas
pip3 install lxml
#git clone https://github.com/Danny-Dasilva/Tensorflow.git
#cd Tensorflow
export TENSORFLOWPATH=${PWD}
cd ObjectDetectionDeps
export PYTHONPATH=$PYTHONPATH:${PWD}:${PWD}/slim
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
