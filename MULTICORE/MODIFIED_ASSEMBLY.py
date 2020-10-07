# consider a Matrix A = 2x2 and Matrix B = 2x2
# no.of elements in A = 4
# no.of elements in B = 4
# N=2 ; M=2; P=2
# STA = 3 (4th element)
# STB = 7 (10th element)
# STC = 11 (18th element)

Memory = [2,
          2,
          2,
          1,2,
          3,4,
          
          5,6,
          7,8,
          
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
        ]

AC = Memory[0]
N = AC
AC = Memory[1]
M = AC
AC = Memory[2]
P = AC

ROW = 0
COL = 0
CURR = 0
Z = 0

A = 0 #Constant value
S = 2 #Constant value
STC = 11 #Constant value
STA = 3 #Constant value
STB = 7 #Constant value
AVAL = 0 #Constant value
SUM = 0 #Constant value

while(True): #mloop
    AC = ROW
    Z = 0
    if(N==ROW):
        Z = 1
    if(Z==0):
        COL = 0
        while(True): #mloop1
            AC = COL
            Z = 0
            if(P==AC):
                Z = 1
            if(Z==0):
                SUM = 0
                while(True):
                    AC = CURR
                    Z = 0
                    if(AC==M):
                        AC = ROW
                        AC = AC * P
                        AC = AC + COL
                        AC = AC * S
                        AC = AC + STC
                        R = AC

                        AC = SUM
                        Memory[R] = AC

                        COL = COL + 1
                        CURR = 0
                        break
                    AC = ROW
                    AC = AC * M
                    AC = AC + CURR
                    AC = AC + STA
                    R = AC
                    AC = Memory[R]
                    AVAL = AC

                    AC = CURR
                    AC = AC * P
                    AC = AC + COL
                    AC = AC + STB
                    R = AC
                    AC = Memory[R]

                    AC = AC * AVAL
                    AC = SUM + AC
                    SUM = AC

                    CURR = CURR + 1

            elif(Z==1):
                ROW = ROW + 1
                break
    elif(Z==1):
        break

print(Memory)
