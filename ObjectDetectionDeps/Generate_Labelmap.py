
import os
path = os.environ['IMAGEPATH'] + '/Train_labels.csv'



import csv
col = []

with open(path, newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        #print(set(row['class']))
        col.append(row['class'])


classes = list(set(col))

print(classes)
count = 0
file1 = open("labelmap.pbtxt","w") 
for label in classes:
    count += 1
    file1.write("item {\n") 
    file1.write("  id: %s\n" % (count)) 
    file1.write("  name: '%s'\n" % (label)) 
    
    file1.write("}\n") 
    file1.write("\n")
 
file1.close() 