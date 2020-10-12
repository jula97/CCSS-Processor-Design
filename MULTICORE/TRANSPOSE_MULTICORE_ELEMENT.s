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


# NoC = 0000 0100     -number of cores is 4
# CoreID = xxxx xxxx  -ID of the core starting from 0000 0000 
# element no starts from 0000 0000

LDAC 0x00       // AC <-- NoC 
MOVEAC R        // R <-- AC    ...(R <- NoC)
LDAC 0x01       //no.of rows in A = no.of rows in C
MOVEAC N
LDAC 0x02  
MOVEAC M
LDAC 0x03
MOVEAC P 

MOVETOAC CoreID
MOVEAC R1
INC R1
MOVETOAC R  
DIV R1     #(NoC)/(CoreID+1)  if (NoC)<(CoreID+1) ==> AC=0   if AC==0 Z==1
JUMPZ end   

loop1:
    MOVETOAC CoreID
    MOVEAC R1
    INC R1
    MOVETOAC N 
    MUL P 
    DIV R1   #(N*P)/(CoreID+1)  if (N*P)<(CoreID+1) ==> AC=0   if AC==0 Z==1
    JUMPZ end

    MOVETOAC CoreID 
    DIV P 
    MOVEAC ROW   #ROW <-- CoreID/P

    MOVETOAC CoreID
    MOD P 
    MOVEAC COL   #COL <-- CoreID%P

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
    MOVETOAC CoreID
    MULV 2
    ADD STC
    MOVEAC STC    #STC<--STC+(CoreID*2)

    RESET CURR       // CURR <-- 0
    RESET SUM

    loop2:
          MOVETOAC CURR   //AC <-- CURR
          XOR M           //AC <-- AC ^ M
          JUMPZ mstore    //if Z==1, jump to mstore  ..... compares CURR and M

          LDAC STA        //AC <-- value at STA (address of current cell in A)
          MOVEAC AVAL     //AVAL <-- AC 

          LDAC STB        //AC <-- value at STB (address of current cell in B)
            
          MUL R1        //AC <-- AC * AVAL(R1)     (result is BVAL *AVAl)
          ADD SUM         //AC <-- AC + SUM 
          MOVEAC SUM      //SUM <-- AC 

          INC CURR        // increment current cell 
          INC STA         // increment STA (address pointer of A)
          INC STB         // increment STB (address pointer of B)

          JUMP loop2

    mstore:
          MOVETOAC SUM    //AC <-- SUM
          STAC STC     //M[STC] <--- AC      (STC is the current cell in C)

    
    MOVETOAC CoreID
    ADD R 
    MOVEAC CoreID  #CoreID = CoreID + NoC
    JUMP loop1


end:
    NOP
