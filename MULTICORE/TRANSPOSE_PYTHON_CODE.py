# consider a Matrix A = 2x2 and Matrix B = 2x2
# no.of elements in A = 4
# no.of elements in B = 4
# N=2 ; M=2; P=2
# STA = 6 (4th element)
# STB = 10 (10th element)
# STC = 14 (18th element)

Memory = [2, 
          4,
          4,
          4,
          2,
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
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0
        ] 



Z = 0
S = 2 #Constant value


def MultiCore(Memory, CoreID):
    global S

    AC = CoreID
    N = AC
    N = N + 1
    AC = Memory[0] #NoC
    R = AC
    Z = 0
    AC = AC / (N)
    if(AC == 0):
        Z = 1

    if(Z==0):
        AC = Memory[1]
        AC = AC / R
        N = AC
        AC = Memory[2]
        M = AC
        AC = Memory[3]
        P = AC

        AC = Memory[4]     ##add to assembly code
        S =AC

        AC = Memory[5]
        STA = AC
        AC = CoreID
        AC = AC * N
        AC = AC * M
        AC = AC + STA
        STA = AC
        A = AC

        AC = Memory[6]
        STB = AC
        B = AC

        AC = Memory[7]
        STC = AC
        AC = CoreID
        AC = AC * N
        AC = AC * P
        AC = AC * S
        AC = AC + STC
        STC = AC

    elif(Z==1):
        True #mend
    return N, M, P, STA, STB, STC, A, B, S

def singlecore(ID):     
    N=0
    M=0
    P=0
    ROW = 0
    COL = 0
    CURR = 0
    Z = 0
    S = 2 #Constant value
    AVAL = 0 #Constant value
    SUM = 0 #Constant value

    N, M, P, STA, STB, STC, A, B, S = map(int,MultiCore(Memory, CoreID=ID))

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

singlecore(0)
singlecore(1)
# singlecore(2)
# singlecore(3)

print(Memory)


