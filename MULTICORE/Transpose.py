NoC = 4
#CoreID = XXXX XXXX

Memory = [4, 
          4,
          4,
          4,
          7,
          23,
          39,

          1,2,3,4,
          5,6,7,8,
          9,10,11,12,
          13,14,15,16,
          
          17,18,19,20,
          21,22,23,24,
          25,26,27,28,
          29,30,31,32,
          
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        ] 

N=0
M=0
P=0
ROW = 0
COL = 0
CURR = 0
Z = 0

A = 0 #Constant value 
S = 2 #Constant value
STC = 39 #Constant value
STA = 7 #Constant value
STB = 23 #Constant value
AVAL = 0 #Constant value
SUM = 0 #Constant value

def MultiCore(Memory, CoreID):
    global N, M, P, STA, STB, STC, S

    AC = CoreID
    N = AC
    N = N + 1
    AC = Memory[0] #NoC
    R = AC
    Z = 0
    print (AC%N)
    AC = AC / (N)
    if(AC == 0):
        Z = 1
    else:
        Z = 0

    if(Z==0):
        AC = Memory[1]
        AC = AC / R
        N = AC
        AC = Memory[2]
        M = AC
        AC = Memory[3]
        P = AC

        AC = Memory[4]
        STA = AC
        AC = CoreID
        AC = AC * N
        AC = AC * M
        AC = AC + STA
        STA = AC
        A = AC

        AC = Memory[5]
        STB = AC
        B = AC

        AC = Memory[6]
        STC = AC
        AC = CoreID
        AC = AC * N
        AC = AC * P
        AC = AC * S
        AC = AC + STC
        STC = AC

    elif(Z==1):
        True #mend
    return N, M, P, STA, STB, STC


N, M, P, STA, STB, STC = MultiCore(Memory, CoreID=1)

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
                        print(R)
                        Memory[int(R)] = AC

                        COL = COL + 1
                        CURR = 0
                        break
                    AC = ROW
                    AC = AC * M
                    AC = AC + CURR
                    AC = AC + STA
                    R = AC
                    AC = Memory[int(R)]
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

