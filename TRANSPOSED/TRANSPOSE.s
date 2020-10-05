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

LOADAC 0x00       //#rows A = #rows C
MOVEAC N          // N <-- AC 
LOADAC 0x01       //#columns A = #rows B
MOVEAC M          // M <-- AC
LOADAC 0x02       //#columns B = #columns C
MOVEAC P
LOADAC 0x03       //Starting address of Mat A in memory
MOVEAC STA
MOVEAC A           
LOADAC 0x04       //Starting address of Mat B in memory
MOVEAC STB
MOVEAC B          
LOADAC 0x05       //Starting address of Mat C in memory
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

        mstore:
            MOVETOAC SUM    //AC <-- SUM
            STOREAC STC     //M[STC] <--- AC      (STC is the current cell in C)

            INC STC         // increment STC twice (one element in C should have 2 bytes)
            INC STC
            
            INC COL        // increment coloumn no.
            RESET CURR     //reset the current cell 

            MOVETOAC ROW   //AC <-- ROW
            MUL M          
            ADD A          //AC <--- (ROW * M ) + A
            MOVEAC STA     //STA <-- AC  
            JUMP mloop1
            
        mloop2:
            MOVETOAC CURR   //AC <-- CURR
            XOR M           //AC <-- AC ^ M
            JUMPZ mstore    //if Z==1, jump to mstore  ..... compares CURR and M

            LOADAC STA      //AC <-- value at STA (address of current cell in A)
            MOVEAC AVAL     //AVAL <-- AC 

            LOADAC STB      //AC <-- value at STB (address of current cell in B)
            
            MUL AVAL        //AC <-- AC * AVAL     (result is BVAL *AVAl)
            ADD SUM         //AC <-- AC + SUM 
            MOVEAC SUM      //SUM <-- AC 

            INC CURR        // increment current cell 
            INC STA         // increment STA (address pointer of A)
            INC STB         // increment STB (address pointer of B)

            JUMP mloop2
    
    mend1:
        INC ROW          //increment the ROW value
        MOVETOAC B       //AC <-- B
        MOVEAC STB       //STB <-- AC  (net effect STB <-- B)
        JUMPZ mloop1

mend:
    NOP
