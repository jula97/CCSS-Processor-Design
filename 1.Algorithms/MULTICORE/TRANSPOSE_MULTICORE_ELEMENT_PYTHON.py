NoC=3

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

def singlecore(ID,Memory=Memory):
    CoreID = ID

    AC=Memory[0]
    R=AC
    AC=Memory[1]
    N=AC
    AC=Memory[2]
    M=AC
    AC=Memory[3]
    P=AC

    AC=CoreID
    R1=AC
    R1=R1+1
    AC=R
    AC=int(AC/R1)
    if AC==0:
        Z=1
    else:
        Z=0

    if Z==1:
        return None

    while True:
        AC=CoreID
        R1=AC
        R1=R1+1
        AC=N
        AC=AC*P
        AC=int(AC/R1)
        if AC==0:
            Z=1
        else:
            Z=0

        if Z==1:
            break
        else:
            AC=CoreID
            AC=int(AC/P)
            ROW=AC 

            AC=CoreID
            AC=int(AC%P)
            COL=AC   

            AC=Memory[4]
            STA=AC
            AC=M
            AC=AC*ROW
            AC=AC+STA 
            STA=AC 

            AC=Memory[5]
            STB=AC
            AC=M
            AC=AC*COL 
            AC=AC+STB 
            STB=AC 

            AC=Memory[6]
            STC=AC 
            AC=CoreID
            AC=AC*2
            AC=AC+STC
            STC=AC

            CURR=0
            SUM=0
            while(True): #mloop2
                AC = CURR
                if(AC==M):    #mstore
                    AC = SUM
                    Memory[STC] = AC
                    break
                
                AC = Memory [STA]
                R1 = AC
                AC = Memory [STB]
                
                AC = AC * R1
                AC = AC + SUM
                SUM = AC    
                CURR = CURR + 1
                STA = STA + 1
                STB = STB + 1
            
            AC=CoreID
            AC=AC+R 
            CoreID=AC


singlecore(0)
singlecore(1)
singlecore(2)
singlecore(3)


print(Memory[39:47])
print(Memory[47:55])
print(Memory[55:63])
print(Memory[63:71])


