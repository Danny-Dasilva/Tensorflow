import os

path = os.getcwd()

for file in os.listdir(path):
    if file.endswith('.xml'):
        print(os.stat(file).st_size)
