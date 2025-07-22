*-----------------------------------------------------------
* Title      : Matrices (2D ARRAYS)
* Written by : dana
* Date       : 
* Description: adding 2 matrices, adding main diagonal, copy pasting mtrx into another
*-----------------------------------------------------------
    ORG    $1000
*adding 2 matrices
*START:                  ; first instruction of program
*    MOVE.L  #MTRX1, A0
*    MOVE.L  #MTRX2, A1
*    MOVE.L  #MTRX, A2
*
*    MOVE.B  #M, D4      ;D4=ROW COUNTER
*    CLR.L   D2          ;D2 OFFSET
*
*LOOP1:
*    MOVE.W  #N, D5      ;D5=COLUMN COUNTER
*    
*LOOP2:
*    MOVE.B  (A0, D2), D6
*    ADD.B   (A1, D2), D6
*    MOVE.B  D6, (A2, D2)
*    BSR     PRINT
*    BRA     AFTER
*    
*PRINT:
*    CLR.L   D1
*    MOVE.W  D6, D1
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 
*    RTS     
*    
*AFTER:
*    ADD.B   #1, D2
*    SUB.W   #1, D5
*    
*    BNE     LOOP2
*    SUB.W   #1, D4
*    BNE     LOOP1
    
    
*adding main diagonal
*START:                 
*    MOVE.L  #MTRX1, A0
*    MOVE.L  #MTRX2, A1
*    MOVE.L  #MTRX, A2
*
*    MOVE.B  #M, D4      ;D4=ROW COUNTER
*    CLR.L   D2          ;D2 OFFSET
*    CLR.L   D3          ;D3=COLUMN COUNTER (declared later)
*    CLR.L   D4
*    MOVE.L  #3, D5      ;diagonal elements range
*
*LOOP1:
*    MOVE.W  #N, D3
*
*LOOP2: 
*    MOVE.B  (A0, D2), D4
*    ADD.B   (A1, D2), D4
*    MOVE.B  D4, (A2, D2)
*    BSR     PRINT
*    SUBQ    #1, D5
*    BNE     NEXT
*    BRA     DONE  
*        
*PRINT:
*    CLR.L   D1
*    MOVE.W  D4, D1
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 
*    RTS   
*
*NEXT:   
*    ADD.B   #4, D2
*    SUB.W   #1, D4
*    BNE     LOOP2
*    SUBQ    #1, D3
*    BNE     LOOP1 
*  
    
*copy pasting mtrx1 into mtrx
*START:
*    MOVEA.L   #MTRX1, A0
*    MOVEA.L   #MTRX, A1
*    MOVE.L    #M, D5      ;D5=ROW COUNTER
*    CLR.L   D2          ;D2 OFFSET
*    CLR.L   D3          ;D3=COLUMN COUNTER (declared later)
*    CLR.L   D4
*
*LOOP1:
*    MOVE.W  #N, D3
*
*LOOP2: 
*    MOVE.B  (A0, D2), D4
*    MOVE.B  D4, (A1, D2)
*    BSR     PRINT
*    BRA     NEXT  
*    
*PRINT:
*    CLR.L   D1
*    MOVE.W  D4, D1
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 
*    RTS   
*    
*NEXT:   
*    ADD.B   #1, D2
*    SUB.L   #1, D3
*    BNE     LOOP2
*    SUB.L   #1, D5
*    BNE     LOOP1
*    

*DONE:
    SIMHALT             ; halt simulator
    
    
    
* Put variables and constants here
    ORG $2000
MTRX1   DC.B    5,2,3,4,3,6,7,8,2
MTRX2   DC.B    4,3,7,6,5,4,3,2,1 
MTRX    DS.B    9  

M       EQU     3
N       EQU     3

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
