# First element in the memory = No.of Cores employed

NoC=4

Memory = [NoC, 
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
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0,
          0,0,0,0
        ] 

Z = 0

def MultiCore(Memory, CoreID):
    State = 1
    N, M, P, STA, STB, STC, A, B=0,0,0,0,0,0,0,0

    AC = CoreID
    N = AC
    N = N + 1
    AC = Memory[0] #NoC
    R = AC
    Z = 0
    AC = int(AC / (N))
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
        AC = AC * 2
        AC = AC + STC
        STC = AC

    elif(Z==1):
        State = 0 #mend
    return N, M, P, STA, STB, STC, A, B, State

def singlecore(ID):     
    N=0
    M=0
    P=0
    ROW = 0
    COL = 0
    CURR = 0
    Z = 0
    R1 = 0 #Constant value
    SUM = 0 #Constant value

    N, M, P, STA, STB, STC, A, B, State = map(int,MultiCore(Memory, CoreID=ID))

    while(True): #mloop
        if State == 0:
            break
        AC = ROW
        Z = 0
        if(N==AC):
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
                        R = AC
                        AC = Memory [STB]
                        
                        AC = AC * R
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
singlecore(2)
singlecore(3)

print(Memory[39:47])
print(Memory[47:55])
print(Memory[55:63])
print(Memory[63:71])

