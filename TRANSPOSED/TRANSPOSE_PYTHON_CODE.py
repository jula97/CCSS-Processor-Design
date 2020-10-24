# consider a Matrix A = 2x2 and Matrix B = 2x2
# no.of elements in A = 4
# no.of elements in B = 4
# N=2 ; M=2; P=2
# STA = 6 (4th element)
# STB = 10 (10th element)
# STC = 14 (18th element)

##Memory = [3,
##          2,
##          3,
##          6,
##          12,
##          18,
##          
##          1,2,
##          3,4,
##          5,6,  
##          
##          5,8,
##          6,9,
##          7,10,
##          
##          0,0,0,0,0,0,
##          0,0,0,0,0,0,
##          0,0,0,0,0,0,
##        ]


Memory = [2,
          2,
          2,
          6,
          10,
          14,
          
          1,2,
          3,4,
          
          5,7,
          6,8,
          
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
AC = Memory[3]
STA = AC
A = AC
AC = Memory[4]
STB = AC
B = AC
AC = Memory[5]
STC = AC

ROW = 0
COL = 0
CURR = 0
Z = 0

AVAL = 0 #Constant value
SUM = 0 #Constant value

while(True): #mloop
    AC = ROW
    Z = 0
    if(N==AC):
        Z = 1
    if(Z==0):
        COL = 0
        
        while(True): #mloop1
            AC = COL
            if(P==AC):
                Z = 1
            if(Z==0):
                SUM = 0
                
                while(True):
                    AC = CURR
                    if(AC==M):
                        AC = SUM
                        
                        Memory[STC] = AC
                        STC = STC + 1
                        STC = STC + 1
                        
                        COL = COL + 1
                        CURR = 0

                        AC = ROW 
                        AC = AC * M
                        AC = AC + A
                        STA = AC
                        break
                    
                    AC = Memory [STA]
                    AVAL = AC
                    AC = Memory [STB]
                    
                    AC = AC * AVAL
                    AC = AC + SUM
                    SUM = AC    
                    CURR = CURR + 1
                    STA = STA + 1
                    STB = STB + 1

            elif(Z==1):
                ROW = ROW + 1
                
                AC = ROW 
                AC = AC * M
                AC = AC + A
                STA = AC
                
                AC = B
                STB = AC
                break
    elif(Z==1):
        break

print(Memory)
