*-----------------------------------------------------------
* Title      : 
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1500

PERIMETER:
    MOVE.L  D0,D1
    CLR.L   D0
    MOVE.B  #0,D2
    
CALC:
    ADD.w   (A0, D2.W),D0
    ADD.B   #1, D2
    SUB.B   #1, D1
    BNE     CALC     
    
    
    ORG     $2000
    
AREA:
    BTST.L  #31,D1
    BEQ     TRI
    MULU.L  D0, D1
    MOVE.L  D1, D2
    
TRI:
    MULU.L  D0, D1
    DIVU.L  #2, D1
    MOVE.L  D1, D2  
    
    
       
    





    SIMHALT             ; halt simulator
    ORG     $1000
CH1     DC.W    10
CH2     DC.W    20 
CH3     DC.W    30  
CH4     DC.L    40

RESULT_PAREIMETER       DS.L    1
RESULT_AREA             DS.L    1
RESULT_VOLUME           DS.L    1

    

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
