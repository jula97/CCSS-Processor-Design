///////Inputs are A and transpose of B

; Operands for MOVEAC,MOVETOAC
;     00000000-N      00000100-COL    00001000-T0
;     00000001-M      00000101-CURR   00001001-T1
;     00000010-P      00000110-SUM    00001010-T2
;     00000011-ROW    00000111-AVAL

; Operands for RESET
;     00000001-ROW
;     00000010-COL
;     00000100-CURR
;     00001000-SUM

; Operands for INC
;     00000001-ROW
;     00000010-COL
;     00000100-CURR


//////NoC = 0000 0100     -number of cores is 4
//////CoreID = xxxx xxxx  -ID of the core starting from 0000 0000 

MOVETOAC CoreID // AC <-- CoreID
MOVEAC N       // N <-- AC
INC N          // N <-- N + 1 ... (N <- CoreID + 1)
LDAC 0x00      // AC <-- NoC 
MOVEAC R       // R <-- AC  (R register has the No. of cores)
DIV N          // AC <-- AC / (CoreID + 1)  , if AC/(CoreID + 1) == 0, set Z = 1 else Z = 0 (if the core_id is more than number of cores --> z=1)
JUMPZ mend     // if Z = 1 no operation


LDAC 0x01       //#rows A = #rows C
DIV R           // AC <- AC / NoC ...  ( N = N/NoC )  - R reg has the no. of cores
MOVEAC N        // N <-- AC 
LDAC 0x02       //#columns A = #rows B
MOVEAC M        // M <-- AC
LDAC 0x03       //#columns B = #columns C
MOVEAC P


LDAC 0x04       //Starting address of Mat A in memory
MOVEAC STA
MOVETOAC CoreID //AC<- CoreID
MUL N           // AC <- CoreID * N
MUL M           // AC <- CoreID * N * M
ADD STA         // AC <- ( CoreID * N * M ) + STA
MOVEAC STA
MOVEAC A           
LDAC 0x05       //Starting address of Mat B in memory
MOVEAC STB
MOVEAC B          
LDAC 0x06       //Starting address of Mat C in memory
MOVEAC STC
MOVETOAC CoreID //AC<- CoreID
MUL N          // AC <- CoreID * N
MUL P          // AC <- CoreID * N * P
MULTWO         // AC <- CoreID * N * P *2  
ADD STC        // AC <- ( CoreID * N * P )+ STC
MOVEAC STC

RESET ROW         // ROW <-- 0
RESET CURR       // CURR <-- 0

mloop:
    MOVETOAC ROW    //AC <-- ROW
    XOR N           //AC <-- AC ^ N
    JUMPZ mend      //if Z==1, jump to mend   ..... compares ROW and N
    RESET COL       //COL <-- 0

    mloop1:
        MOVETOAC COL    //AC <-- COL
        XOR P           //AC <-- AC ^ P
        JUMPZ mend1     //if Z==1, jump to mend1  ..... compares COL and P
        RESET SUM       //SUM <-- 0
        JUMP mloop2     

        mloop2:
            MOVETOAC CURR   //AC <-- CURR
            XOR M           //AC <-- AC ^ M
            JUMPZ mstore    //if Z==1, jump to mstore  ..... compares CURR and M

            LDAC STA      //AC <-- value at STA (address of current cell in A)
            MOVEAC R    //R <-- AC (AVAL is stored in R)

            LDAC STB      //AC <-- value at STB (address of current cell in B)
            
            MUL R        //AC <-- AC * AVAL     (result is BVAL *AVAl)
            ADD SUM         //AC <-- AC + SUM 
            MOVEAC SUM      //SUM <-- AC 

            INC CURR        // increment current cell 
            INC STA         // increment STA (address pointer of A)
            INC STB         // increment STB (address pointer of B)

            JUMP mloop2

        mstore:
            MOVETOAC SUM    //AC <-- SUM
            STAC STC     //M[STC] <--- AC      (STC is the current cell in C)

            INC STC         // increment STC twice (one element in C should have 2 bytes)
            INC STC
            
            INC COL        // increment coloumn no.
            RESET CURR     //reset the current cell 

            MOVETOAC ROW   //AC <-- ROW
            MUL M          
            ADD A          //AC <-- (ROW*M) + A
            MOVEAC STA     //STA <-- AC  
            JUMP mloop1
    
    mend1:
        INC ROW          //increment the ROW value

        MOVETOAC ROW   //AC <-- ROW
        MUL M          
        ADD A          //AC <-- (ROW*M) + A
        MOVEAC STA     //STA <-- AC   (net effect STA <-- (ROW*M) + A)
        MOVETOAC B       //AC <-- B
        MOVEAC STB       //STB <-- AC  (net effect STB <-- B)

        JUMP mloop

mend:
    NOP
