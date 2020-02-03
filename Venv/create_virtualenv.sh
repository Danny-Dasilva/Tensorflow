#!/bin/bash
sudo apt install virtualenv -y

sudo pip3 install virtualenvwrapper -y

BSHRC=~/.bashrc

PY_PTH=$(which python3)

export VIRTUALENVWRAPPER_PYTHON=${venv_pth}
mkdir ~/.Envs
export WORKON_HOME=~/.Envs
echo 'VIRTUALENVWRAPPER_PYTHON'

echo `VIRTUALENVWRAPPER_PYTHON=${PY_PTH}`
echo `VIRTUALENVWRAPPER_PYTHON=${PY_PTH}`
echo `VIRTUALENVWRAPPER_PYTHON=${PY_PTH}`
echo `VIRTUALENVWRAPPER_PYTHON=${PY_PTH}`

if grep -q "WORKON_HOME" "$BSHRC";
    then
        echo "Files are here"
    else
        echo "Writing ENVS folder"
        mkdir -p $WORKON_HOME

        echo "exporting env variables to bashrc"
        
        echo 'WORKON_HOME=~/.Envs' >> $BSHRC

        # weird error
        echo `VIRTUALENVWRAPPER_PYTHON=${PY_PTH}` >> $BSHRC
     
        venvdir=$(which virtualenvwrapper.sh)

        echo `source $venvdir` >> $BSHRC
fi
source $BSHRC
venvdir=$(which virtualenvwrapper.sh)
source $venvdir


