*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG $5000
LOOP1:
*COPYING MIDDLE ROW
    MOVE.B  #2, D0 ;D0=ROW
    MOVE.B  #3, D1 ;D1=COLUMNS
    BSR     CLEAR_ELEMENT
    BSR     CALC_ADD
    
    
    SUB.B   #1, D1
    BEQ     LOOP2
    
    

         
    



LOOP2:
*COPYING MIDDLE COLUMN


    



    SIMHALT             ; halt simulator
    
    ORG $500
CALC_ADD:
    MOVEA.L #FIRST, A0      ;D0=I ;D1=J
    SUB.W   #1, D0
    MULU.W  #3, D0
    SUB.W   #1, D1
    ADD.W   D0, D1
    ADDA.W  D1, A0
    RTS
    
    ORG    $4000
CLEAR_ELEMENT:
    MOVEA.L #FIRST, A1
    MOVEA.L A1, A0
    MOVE.L  D2, D0
    MOVE.L  D3, D1
    BSR CALC_ADD
    CLR.L   (A0)
    RTS
    
    
    ORG $1000
FIRST    DC.W    1,2,3,4,5,6,7,8,9  

    ORG $2000
SECOND   DC.W    a,b,c,d,e,f,g,h,i

i   DS.W    1
j   DS.W    1

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
