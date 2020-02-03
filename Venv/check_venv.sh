
#!/bin/bash
BSHRC=~/.bashrc

until [ "${obs_venv}" == "$obs_input" ] ; do
    venvdir=$(which virtualenvwrapper.sh)
    echo '$venvdir'
    echo $venvdir
    echo $venvdir
    echo $venvdir
    source $venvdir
    workon $obs_input
    if  [ "$VIRTUAL_ENV" != "" ]
    then
        venv_pth=$VIRTUAL_ENV
        obs_venv=${venv_pth##*/}
            if  [ "${obs_venv}" == "$obs_input" ]
            then 
                echo "functional"
                echo ${obs_venv}
                if grep -q "export obs_venv" "$BSHRC";
                    then
                        echo "Overwriding previous obs_venv"
                        grep -v "export obs_venv" $BSHRC > temp && mv temp $BSHRC
                        echo "export obs_venv="$obs_venv"" >> $BSHRC 
                    else
                        echo "export obs_venv="$obs_venv"" >> $BSHRC
                fi
                break
            else
                echo "deactivating"
                deactivate
                mkvirtualenv $obs_input
            fi
    else
        echo "not in venv"
        my_dir=`dirname $0`
        sh ./Venv/create_virtualenv.sh
        echo "create virtualenv"
        
        #fix this
        mkvirtualenv $obs_input --python=/usr/bin/python3
        echo "mkvirtualenv env"
    fi
done


echo `WORKING IN ${venvdir}`



