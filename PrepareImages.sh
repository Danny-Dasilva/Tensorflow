# weird hACK WORKAROUND FOR SH VARIABLES 

eval "$(cat ~/.bashrc | tail -n +10)"
export TENSORFLOWPATH=${PWD}
cd ObjectDetectionDeps
cd ..

export PYTHONPATH=$PYTHONPATH:${PWD}:${PWD}/slim
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


#workon ${obs_venv}
#echo ${obs_venv}


#used in generate_tfrecord.py
cd ObjectDetectionDeps
export ObjectDetectionDeps=${PWD}
cd ..
# end tf_record

rm -rf working_img_dir
mkdir working_img_dir
cp -a put_files_here/. working_img_dir

cd working_img_dir

#rm OrganizeImageDirectory.py pipeline.config labelmap.pbtxt xml_to_csv.py generate_tfrecord.py RenameImageData.py Generate_Labelmap.py
#rm -r Images Model


echo ${TENSORFLOWPATH}
cp ${TENSORFLOWPATH}/ObjectDetectionDeps/OrganizeImageDirectory.py ${PWD}
cp ${TENSORFLOWPATH}/ObjectDetectionDeps/RenameImageData.py ${PWD}


mkdir Images
export IMAGEWORKDIR=${PWD}

cd Images
export IMAGEPATH=${PWD}
mkdir Train
cd Train
export TRAININGPATH=${PWD}
cd ..
mkdir Test
cd Test
export TESTINGPATH=${PWD}
cd ..
cd ..
python3 RenameImageData.py
python3 OrganizeImageDirectory.py
cp ${TENSORFLOWPATH}/ObjectDetectionDeps/xml_to_csv.py ${PWD}
cp ${TENSORFLOWPATH}/ObjectDetectionDeps/generate_tfrecord.py ${PWD}
cp ${TENSORFLOWPATH}/ObjectDetectionDeps/Generate_Labelmap.py ${PWD}

python3 xml_to_csv.py

python3 Generate_Labelmap.py

python3 generate_tfrecord.py --csv_input=${IMAGEPATH}/Train_labels.csv --image_dir=${TRAININGPATH} --output_path=${IMAGEPATH}/train.record
python3 generate_tfrecord.py --csv_input=${IMAGEPATH}/Test_labels.csv --image_dir=${TESTINGPATH} --output_path=${IMAGEPATH}/test.record

mkdir Model

cd Model

export MODEL_DIR=${PWD}

cd ..
cp ${TENSORFLOWPATH}/Training/CKPT/pipeline.config ${PWD}
sed -i "s|LABELMAP|${IMAGEWORKDIR}/labelmap.pbtxt|g" pipeline.config
sed -i "s|TRAINRECORD|${IMAGEPATH}/train.record|g" pipeline.config
sed -i "s|TESTRECORD|${IMAGEPATH}/test.record|g" pipeline.config
sed -i "s|FINETUNE|${TENSORFLOWPATH}/Training/CKPT/model.ckpt|g" pipeline.config
export num_training_steps=3000
echo ${num_training_steps}
echo "$(tput setaf 9)$(tput setab 3) ${num_training_steps} $(tput sgr 0)"
echo "$(tput setaf 9)$(tput setab 3) Beginning training $(tput sgr 0)"

${TENSORFLOWPATH}/ObjectDetectionDeps/retrain_detection_model.sh
