sudo pip3 install virtualenv

sudo pip3 install virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

export WORKON_HOME=~/.Envs
echo 'WORKON_HOME=~/.Envs' >> ~/.bashrc

echo 'VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> ~/.bashrc
mkdir -p $WORKON_HOME
source ~/.local/bin/virtualenvwrapper.sh
echo 'source ~/.local/bin/virtualenvwrapper.sh' >> ~/.bashrc
