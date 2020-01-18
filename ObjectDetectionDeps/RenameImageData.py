import os
import xml.etree.ElementTree as ET
path = os.getcwd()
images = []
count = 0
names = []
for filename in os.listdir(path):
    if filename.endswith('.png'):
        count+=1
        images.append(filename.split(".")[0]+".xml")
        tree = ET.parse(filename.split(".")[0]+".xml")
        root = tree.getroot()
        name = root[6][0].text
        if name not in names:
            names.append(name)
        root[1].text = name+"_"+str(count)+".png"
        root[2].text = path+"/"+name+"_"+str(count)+".png"
        os.rename(path+"/"+filename, path+"/"+name+"_"+str(count)+".png")
        os.rename(path+"/"+filename.split(".")[0]+".xml", path+"/"+name+"_"+str(count)+".xml")
        tree.write(name+"_"+str(count)+".xml")
count = 0
f= open("labelmap.pbtxt","w+")
for name in names:
    count += 1
    f.write("item {\n")
    f.write(f"  id: {count}\n")
    f.write(f"  name: '{name}'\n")
    f.write("}\n")
    f.write('\n')
f.close()
print(images)
