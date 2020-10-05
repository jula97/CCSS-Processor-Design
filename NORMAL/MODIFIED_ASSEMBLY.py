# consider a Matrix A = 3x2 and Matrix B = 2x4
# no.of elements in A = 6
# no.of elements in B = 8
# N=3 ; M=2; P=4
# STA = 3 (4th element)
# STB = 9 (10th element)
# STC = 17 (18th element)

Memory = [3,
          2,
          4,
          0,0,
          0,0,
          0,0,
          
          0,0,0,0,
          0,0,0,0,
          
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
STC = 17 #Constant value
STA = 3 #Constant value
STB = 9 #Constant value
AVAL = 0 #Constant value
SUM = 0 #Constant value


def mloop():
    AC = ROW
    Z = 0
    if(N==ROW):
        Z = 1
    if(Z==1):
        mend()
    COL = 0

def mloop1():
    AC = COL
    Z = 0
    if(P==AC):
        Z = 1
    if(Z==1):
        mend1()
    SUM = 0
    mloop2()

def mstore():
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
    mloop1()

def mloop2():
    AC = CURR
    Z = 0
    if(AC==M):
        mstore()
    
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
    mloop2()

def mend1():
    ROW = ROW + 1
    mloop()

def mend():
    break

while(True):
    mloop()
    mloop1()
    mstore()
    mloop2()
    mend1()
    mend()

# while(True):
#     AC = ROW
#     Z = 0
#     if(N==ROW):
#         Z = 1
#     if(Z==1):
#         mend()
#     else:
#         COL = 0

#     while(True): #mloop1
#         AC = COL
#         Z = 0
#         if(P==AC):
#             Z = 1
#         if(Z==1):
#             mend1()
#         SUM = 0
#         mloop2()

#         while(True): #mstore
#             AC = ROW
#             AC = AC * P
#             AC = AC + COL
#             AC = AC * S
#             AC = AC + STC
#             R = AC

#             AC = SUM
#             Memory[R] = AC

#             COL = COL + 1
#             CURR = 0
#             #goto mploop1

#         while(True): #mloop2
#             AC = CURR
#             Z = 0
#             if(AC==M):
#                 #goto mstore
#                 True
            
#             AC = ROW
#             AC = AC * M
#             AC = AC + CURR
#             AC = AC + STA
#             R = AC
#             AC = Memory[R]
#             AVAL = AC

#             AC = CURR
#             AC = AC * P
#             AC = AC + COL
#             AC = AC + STB
#             R = AC
#             AC = Memory[R]

#             AC = AC * AVAL
#             AC = SUM + AC
#             SUM = AC

#             CURR = CURR + 1
#             #goto mloop2
        
#     while(True): #mend1

#         ROW = ROW + 1
#         #goto mloop