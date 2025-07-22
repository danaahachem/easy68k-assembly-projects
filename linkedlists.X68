*-----------------------------------------------------------
* Title      : linked lists
* Written by : dana
* Date       :
* Description: insert at the end, adding after the third element, deleting, and others
*-----------------------------------------------------------
    ORG    $1000
 *insert at the end of linked list
START:                 
    LEA     E1,A0
    
LOOP:
    TST.L   (A0)
    BEQ     INSERT_END
    MOVEA.L (A0),A0
    BRA     LOOP
    
INSERT_END:
    LEA     E, A1
    MOVE.L  A1, (A0)
    CLR.L   (A1)
    MOVE.L  E,(4,A1)
    
    
*insert at third element of linked list
START2:
    MOVE.L  #3, D0
THIRD:
    MOVEA.L (A0),A0
    SUB.B   #1, D0
    BNE     THIRD
    LEA     E, A1
    MOVE.L  (A0),(A1)   
    MOVE.L  A1, (A0)
    
    
*deleting third element
START3:
    MOVE.L  #3,D0
REMOVE_THIRD:
    MOVEA.L (A0),A0
    SUB.B   #1,D0
    BNE     REMOVE_THIRD
    MOVEA.L (A0),A1
    MOVE.L  (A1),(A0)
    CLR.L   (A1)        ;clear pointer
    CLR.L   ($4,A1)     ;clear content
  
  
*deleting last element
START4:
    LEA     E1,A0
    MOVEQ   #0,D0  
    
CHECK:
    MOVEA.L (A0),A1
    CMP.L   D0,A1       ;check if head points to 0
    BEQ     DONE
    
    CMP.L   D0,(A1)
    BEQ     DELETE_END
    
    MOVEA.L A1,A0
    BRA     LOOP

DELETE_END:
    CLR.L   (A0)
    CLR.L   (A1)        ;clear pointer
    CLR.L   ($4,A1)     ;clear content
    

*You are given a linked list where each node contains a student ID and a GPA (both 32-bit values).
*Write an Easy68K assembly program that searches the linked list for a specific student ID (stored in register D2). 
*If the student is found, update their GPA to a new value (stored in D3).
*If the student is not found, do nothing.
*The list ends when the pointer field of a node is 0.

START0:
    MOVE.L  #2023000313, D2
    MOVE.L  #100, D3
    MOVE.L  #ID, D0  
    MOVE.L  #GPA, D1           
    LEA     E1, A0
    
SEARCH:
    TST.L   (A0)
    BEQ     EXIT
    CMP.L   (A0, D0), D2
    BEQ     UPDATE_GPA
    MOVEA.L (A0), A0
    BRA     SEARCH

UPDATE_GPA:
    MOVE.L D3, (A0,D1) 


*Copy the ID and GPA of every node in the original list to a new list that starts at label NEW_LIST.
*You will assume that the new list is pre-allocated with the same number of empty nodes.
    
START6:
    LEA     E1, A0
    LEA     NEW_LIST, A1 
    MOVE.L  #ID, D0
    MOVE.L  #GPA, D1
    
COPY:
    TST.L   (A0)
    BEQ     EXIT
    TST.L   (A1)
    BEQ     EXIT
    MOVE.L  (A0,D0), (A1,D0)
    MOVE.L  (A0,D1), (A1,D1)
    MOVEA.L (A0),A0
    MOVEA.L (A1),A1
    BRA     COPY
    
*delete value of a node
START7:
    MOVE.L  #2023000313, D2
    MOVE.L  #ID, D0  
    MOVE.L  #GPA, D1           
    LEA     E1, A0
    
SEARCH:
    TST.L   (A0)
    BEQ     EXIT
    CMP.L   (A0, D0), D2
    BEQ     DELETE_GPA
    MOVEA.L (A0), A0
    BRA     SEARCH

DELETE_GPA:
    CLR.L (A0,D1) 
    

*count nodes
START8:
    MOVE.L  #ID, D0  
    MOVE.L  #GPA, D1           
    LEA     E1, A0
    MOVE.L  #0, D2
    
COUNT:
    TST.L   (A0)
    BEQ     EXIT
    ADD.L   #1, D2
    MOVE.L  (A0),A0
    BRA     COUNT
    
    
EXIT:    
    
    
    SIMHALT             ; halt simulator

    ORG $2000

E1    DC.L    E2
      DC.L    2023000313  
      DC.L    40

E2    DC.L    E3
      DC.L    2023000612
      DC.L    60

E3    DC.L    0
      DC.L    2023000914
      DC.L    70
      
ID    EQU     4
GPA   EQU     8
            
    ORG $3000
E     DC.L    $ABCD

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
