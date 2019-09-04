
BSHRC=~/.bashrc


until [ "${obs_venv}" == "$obs_input" ] ; do

    source ~/.local/bin/virtualenvwrapper.sh
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
        ./create_virtualenv.sh
        mkvirtualenv $obs_input
    fi
done
source $BSHRC
echo "WORKING IN OBJECT_DETECTION"



# until [ "${obs_venv}" == "222" ] ; do

#     source ~/.local/bin/virtualenvwrapper.sh
#     workon 222
#     if  [ "$VIRTUAL_ENV" != "" ]
#     then
#         venv_pth=$VIRTUAL_ENV
#         obs_venv=${venv_pth##*/}
#             if  [ "${obs_venv}" == "222" ]
#             then 
#                 echo "functional"
#                 echo ${obs_venv}
#                 break
#             else
#                 deactivate
#             fi
#     else
#         echo "not in venv"
#         ./create_virtualenv.sh
#         mkvirtualenv 222
#     fi
# done

# echo "WORKING IN OBJECT_DETECTION"



