import os
import shutil
path = os.getcwd()

print(os.listdir(path))

#shutil.rmtree(path + '/Model')
shutil.rmtree(path +'/Images')
for file in os.listdir(path):
    if file.endswith('.jpg'):
        os.remove(file)
    if file.endswith('.xml'):
            os.remove(file) 
    if file.endswith('.png'):
            os.remove(file) 
    if file.endswith('.pbtxt'):
            os.remove(file) 