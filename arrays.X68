*-----------------------------------------------------------
* Title      : arrays
* Written by : dana
* Date       : 04/18/2024
* Description:
*-----------------------------------------------------------
    ORG    $400
*find smallest/largest element
*START:                  
*    MOVEA.L #ARRAY, A0
*    MOVE.L  (A0), D0    ;D0 = SMALLEST ELEMENT FIRST ONE
*    MOVE.W  SIZE, D1 
*    
*LOOP:   
*    ADDA.L  #4, A0
*    MOVE.L  (A0), D3
*    SUB.L   #1, D1
*    BEQ     EXIT 
*    
*    CMP.L   D0, D3
*    BLE     REPEAT      ; if you want to find max element, use BGE here 
*    BRA     LOOP
*         
*REPEAT:
*    MOVE.L  D3, D0
*    BRA     LOOP 

*EXIT:
*    MOVE.L  D0, D1
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 


*reverse array
*START:
*    MOVEA.L #ARRAY, A0
*    LEA     REVERSE, A1
*    MOVE.W  SIZE, D2       
*    MOVE.L  D2, D6
*    MOVE.L  D6, D3
*    MOVE.L  #0, D7
*    MULU.W  #4, D2     ;D4=40
*    MOVEQ   #0, D5     ;D3=0
*
*LOOP0:
*    SUB.L   #4, D2     ;D0-4
*    MOVE.L  (A0, D5), (A1, D2)
*    ADD.L   #4, D5
*    SUBQ    #1, D6
*    BNE     LOOP0
*    BRA     PRINT0
*  
*PRINT0:
*    MOVE.L  (A1, D7), D1
*    ADDQ    #4, D7
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 
*    SUBQ    #1,D3
*    BNE     PRINT0

*sum of elements in array
*START:
*    MOVEA.L #ARRAY, A0
*    MOVE.W  SIZE, D2
*    MOVEQ   #0, D3
*    
*LOOP:
*    ADD.L   (A0,D3), D1
*    SUB.W   #1, D2
*    BEQ     PRINT
*    ADD.L   #4, D3
*    BRA     LOOP
*
*PRINT:
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15   


*count occurence of element
*START:
*    MOVEA.L #ARRAY, A0
*    MOVE.W  SIZE, D2
*    MOVE.L  #2016, D3
*    MOVE.L  #0, D4
*    MOVE.L  #0, D1
*    
*LOOP:
*    CMP.L   (A0, D4), D3
*    BNE     NEXT
*    ADD.L   #1, D1
*    
*NEXT:
*    ADD.L   #4, D4
*    SUB.L   #1, D2
*    BNE     LOOP
*    BRA     PRINT     
*    
*PRINT:
*    CLR.L   D0
*    MOVE.B  #3, D0
*    TRAP    #15 
    
*replace certain element
START:
    MOVEA.L #ARRAY, A0
    MOVE.W  SIZE, D2
    MOVE.L  D2,D6
    MOVE.L  #2016, D3
    MOVE.L  #0, D4
    MOVE.L  #2025, D5
    MOVE.L  #0, D7
    MOVE.L  #0, D1
    
LOOP:
    CMP.L   (A0, D4), D3
    BNE     NEXT
    MOVE.L  D5, (A0,D4) 
    
NEXT:
    ADDQ.L  #4, D4
    SUB.L   #1, D2
    BNE     LOOP
    BRA     PRINT
    
PRINT:
    MOVE.L  (A0, D7), D1
    ADDQ    #4, D7
    CLR.L   D0
    MOVE.B  #3, D0
    TRAP    #15 
    SUBQ    #1,D6
    BNE     PRINT
        

    SIMHALT             ; halt simulator

    ORG     $1000

ARRAY   DC.L    2016,3033,2224,2559,2016,1015,8863,4452,9926,2016
REVERSE DS.L    10
SIZE    DC.W    10
SMALL   DS.L    1
ADDRS_SML   DS.L  1  
SUM_3   DS.L    1

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
