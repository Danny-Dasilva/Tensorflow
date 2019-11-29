from PIL import Image
import os
path = os.getcwd()
images = []
for filename in os.listdir(path):
    if filename.endswith('.jpg'):
        im = Image.open(filename)
        im.save(os.path.splitext(filename)[0]+ '.png')