import os, sys

#reading data from the text file
file1 = open(os.path.join(sys.path[0], "datain.txt"), 'r') 
data = []
for lines in file1:
    data.append(lines.strip())
print("Data Given; ",  data)

start_B = data.index('*')
start_A = 3

N = start_B - start_A
M = len(data[3].split(" "))
P = len(data[start_B + 1].split(" "))

num_cores = int(data[2])
num_rows_add = (num_cores -( N % num_cores))%num_cores
for i in range(0, num_rows_add):
    data.insert(start_B, "0 " * M)


data.pop(start_B + num_rows_add) #removes the start mark
data.insert(3, P)
data.insert(3, M)
data.insert(3, N + num_rows_add)

print("Data Edit; ",  data)

#updating data
ADDRESS_LENGTH = 3
WIDTH = int(data[0])
DEPTH = int(data[1])
PROCESSOR_COUNT = int(data[2])
N = int(data[3])
M = int(data[4])
P = int(data[5])
STA = 7
STB = 0
STC = 0
RAM = [PROCESSOR_COUNT, N, M, P, STA, STB, STC]
A_COUNT = 0
   
#Inserting A matrix data
for i in range(6, 6 + int(N)):
    row = data[i].strip().split(" ")
    for each in row:
        A_COUNT += 1
        RAM.append(int(each))

STB = STA + A_COUNT
RAM[5] = STB

#Insering B matrix data
MAT_B = []
for i in range(6 + int(N), 6 + int(N) + int(M)):
    row = data[i].strip().split(" ")
    lis = []
    for each in row:
        lis.append(int(each))
    MAT_B.append(lis)

B_COUNT  = 0
for i in range(0, len(MAT_B[0])):
    for j in range(0, len(MAT_B)):
        B_COUNT += 1
        RAM.append(MAT_B[j][i])

STC = STB + B_COUNT
RAM[6] = STC

print("RAM: " , RAM)

#Adding data to the txt file
FINAL = []
for each in range(0, len(RAM)):
    addr = ((ADDRESS_LENGTH) - len(hex(each)[2:].upper())) * '0' + hex(each)[2:].upper()
    value = ((int(WIDTH/16) - len(hex(RAM[each])[2:])) * '0') + hex(RAM[each])[2:].upper() + ';'
    FINAL.append(addr + " : " + value)
FINAL.append("[" + ((ADDRESS_LENGTH) - len(hex(len(RAM))[2:].upper())) * '0' + (hex(len(RAM))[2:].upper()) + ".." + (ADDRESS_LENGTH - len(hex(DEPTH-1)[2:].upper())) * '0' + hex(DEPTH-1)[2:].upper() + "]" + " : "  + (int(WIDTH/16) * '0') + ';')

print(FINAL)

fileData = open("DRAM.txt","w")
for each in FINAL:
    fileData.write(each)
    fileData.write('\n')
fileData.close()
