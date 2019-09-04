sudo pip3 install virtualenv

sudo pip3 install virtualenvwrapper

BSHRC=~/.bashrc


export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

export WORKON_HOME=~/.Envs


if grep -q "WORKON_HOME" "$BSHRC";
then
echo "Files are here"
else
echo "Adding bashrc files"
mkdir -p $WORKON_HOME
echo 'WORKON_HOME=~/.Envs' >> $BSHRC

echo 'VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> $BSHRC

echo 'source ~/.local/bin/virtualenvwrapper.sh' >> $BSHRC
fi

source ~/.local/bin/virtualenvwrapper.sh


