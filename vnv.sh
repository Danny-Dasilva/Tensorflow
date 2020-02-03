dir=$PWD

chmod a+x "$dir"/Venv/check_venv.sh
chmod a+x "$dir"/Venv/create_virtualenv.sh

read -p 'Write the name your virtual environment: ' obs_input
echo
echo $obs_input

source Venv/check_venv.sh