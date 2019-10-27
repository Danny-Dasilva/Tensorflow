#!/bin/bash
sudo apt install virtualenv

sudo pip3 install virtualenvwrapper

BSHRC=~/.bashrc

VENVPATHH=$(which python3)

export VIRTUALENVWRAPPER_PYTHON=${VENVPATHH}

export WORKON_HOME=~/.Envs


if grep -q "WORKON_HOME" "$BSHRC";
    then
        echo "Files are here"
    else
        echo "Writing ENVS folder"
        mkdir -p $WORKON_HOME

        echo "exporting env variables to bashrc"
        
        echo 'WORKON_HOME=~/.Envs' >> $BSHRC
        echo `VIRTUALENVWRAPPER_PYTHON=${VENVPATHH}` >> $BSHRC
     
        venvdir=$(which virtualenvwrapper.sh)

        echo `source $venvdir` >> $BSHRC
fi
source $BSHRC
venvdir=$(which virtualenvwrapper.sh)
source $venvdir


