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
/////element no starts from 0000 0000

LDAC 0x00       // AC <-- NoC 
MOVEAC R        // R <-- AC    ...(R <- NoC)
LDAC 0x01   //no.of rows in A = no.of rows in C
MOVEAC N

mloop1:

LDAC 0x02   //no.of columns in A = no.of rows in B
MOVEAC M
LDAC 0x03   //no.of columns in B = no.of columns in C - (P is loaded to AC)
MUL ROW     // AC <-- AC * ROW ... [P*ROW]
ADD COL     // AC <-- AC+ COL  ... [P*ROW + COL] -- Element No. is in AC

MOD R        // Element no. is mod by the No. of cores -- answer is from 0000 0000 to (NOC - 1)****
XOR CoreID      // AC <-- AC (+) CoreID.. if equal Z=1 else Z=0 
JUMPNZ mend      // if Z = 0 no operation ****

LDAC 0x04       //Starting address of Mat A in memory
MOVEAC STA
MOVETOAC M
MUL ROW
ADD STA       // AC <-- STA + (M*ROW)
MOVEAC STA    // STA <-- STA + (M*ROW) .... STA is pointed at the first element of the respective row 
         
LDAC 0x05       //Starting address of Mat B in memory
MOVEAC STB
MOVETOAC M
MUL COL
ADD STB       // AC <-- STB + (M*COL)
MOVEAC STB    // STB <-- STB + (M*COL) .... STB is pointed at the first element of the respective colomn
        
LDAC 0x06       //Starting address of Mat C in memory
MOVEAC STC

RESET CURR       // CURR <-- 0

 mloop2:
          MOVETOAC CURR   //AC <-- CURR
          XOR M           //AC <-- AC ^ M
          JUMPZ mstore    //if Z==1, jump to mstore  ..... compares CURR and M

          LDAC STA      //AC <-- value at STA (address of current cell in A)
          MOVEAC AVAL     //AVAL <-- AC 

          LDAC STB      //AC <-- value at STB (address of current cell in B)
            
          MUL AVAL        //AC <-- AC * AVAL     (result is BVAL *AVAl)
          ADD SUM         //AC <-- AC + SUM 
          MOVEAC SUM      //SUM <-- AC 

          INC CURR        // increment current cell 
          INC STA         // increment STA (address pointer of A)
          INC STB         // increment STB (address pointer of B)

          JUMP mloop2

mstore:
          MOVETOAC SUM    //AC <-- SUM
          STAC STC     //M[STC] <--- AC      (STC is the current cell in C)

MOVETOAC R    //move NoC to AC
MULV S        // AC <-- NoC * S 
ADD STC       // AC <-- STC + (NoC * S)
MOVEAC STC

JUMP mloop1


