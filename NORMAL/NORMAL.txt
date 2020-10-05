; Operands for MOVEAC,MOVETOAC
;     00000000-N      00000100-COL    00001000-T0
;     00000001-M      00000101-CURR   00001001-T1
;     00000010-P      00000110-SUM    00001010-T2
;     00000011-ROW    00000111-AVAL

; Operands for RST
;     00000001-ROW
;     00000010-COL
;     00000100-CURR
;     00001000-SUM

; Operands for INC
;     00000001-ROW
;     00000010-COL
;     00000100-CURR

LOADAC 0x00   //no.of rows in A = no.of rows in C
MOVEAC N
LOADAC 0x01   //no.of columns in A = no.of rows in B
MOVEAC M
LOADAC 0x02   //no.of columns in B = no.of columns in C
MOVEAC P

RESET ROW        //ROW <-- 0x00
RESET CURR       //CURR <-- 0x00

mloop:
    MOVETOAC ROW
    XOR N         // ac<-- ac XOR N , if ac XOR N ==0 then z=1
    JUMPZ mend    // JUMP if z=1
    RESET COL     //COL <-- 0x00

    mloop1:
        MOVETOAC COL
        XOR P
        JUMPZ mend1 
        RESET SUM    //SUM <-- 0x00
        JUMP mloop2

        mstore:
            MOVETOAC ROW
            MUL P    // AC <-- AC*P 
            ADD COL  // AC <-- AC+COL	
            MULV S
            ADDV STC
            MOVEAC R

            MOVETOAC SUM
            STOREAC R

            INC COL
            RESET CURR
            JUMP mloop1

        mloop2:
            MOVETOAC CURR
            XOR M             
            JUMPZ mstore

            MOVETOAC ROW
            MUL M 
            ADD CURR
            ADDV STA
            MOVEAC R
            LOADAC R
            MOVEAC AVAL

            MOVETOAC CURR
            MUL P 
            ADD COL
            ADDV STB
            MOVEAC R
            loadac R    
        
            MUL AVAL
            ADD SUM
            MOVEAC SUM

            INC CURR
            JUMP mloop2

    mend1:
        INC ROW
        JUMP mloop

mend:
    NOP

