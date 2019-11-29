from PIL import Image
import os
path = os.getcwd()
xml_list  []
for xml in os.listdir(path):
    if xml.endswith('xml'):
        xml_list.append(os.path.splitext(xml)[0])

for filename in os.listdir(path):
    if filename.endswith('.jpg'):
        if os.path.splitext(filename)[0] in xml_list
            im = Image.open(filename)
            im.save(os.path.splitext(filename)[0]+ '.png')
        else:
            print(filename)