*-----------------------------------------------------------
* Title      : MCO Assignment
* Written by : Group1: Ali Awada, Malak Darwish, Dana Hachem, Mahdi Zein Al Dine
* Date       : 16/4/2025
* Description: This is the code of the assingment about Linked-Lists, the code is defined at ORG $1000 and all data at ORG $2000
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    LEA         Student1, A0
    
TASK1:
PRINT_LETTER_GRADE  
    CLR.L         D1
    CLR.L         D2
    MOVE.L      (ID,A0), D1
    BSR         Print_ID
    
    BSR         Print_NAME
   
    CLR.L        D1
    MOVE.W      (GPA, A0), D1
    BSR         Print_GPA

    
    CLR.L       D1
    MOVE.W      (GPA, A0), D1
    BSR         Print_GPA_LETTERGRADE
    BSR         NEWLINE

    
    TST.L       (A0)
    BEQ         TASK2
    MOVEA.L     (A0), A0
    BRA         PRINT_LETTER_GRADE  ;end of main1
    
 
TASK2:   

    BSR         NEWLINE
    BSR         Print_message         
    BSR         PRINT_HONOR


TASK3:
     
     CLR.L   D0
     LEA     ENTERING_MESSAGE, A1
     MOVE.B  #14, D0
     TRAP    #15
     BSR     NEWLINE 
    
     CLR.L   D0
     MOVE.B  #4, D0
     TRAP    #15
     
     CMP.L   #0, D1
     BEQ     EXIT
     
     MOVE.L  D1, D2
     BSR     SEARCH    
     BRA     TASK3
     
     BRA EXIT
 
    
Print_ID
    CLR.L         D0

    MOVE.B       #3,D0   
    TRAP         #15     
    BSR         NEWLINE
    RTS
    
    
NEWLINE:
    LEA         CRLF,A1
    MOVE.B      #13,D0         
    TRAP        #15
    RTS


Print_NAME:
    CLR.L   D0
    LEA     (Name, A0), A1  
    MOVE    #14, D0 
    TRAP    #15  
    BSR     NEWLINE         
    RTS
    
    
Print_message:
    CLR.L   D0
    LEA     HONOR_MESSAGE, A1
    MOVE    #14, D0
    TRAP    #15
    BSR     NEWLINE 
    RTS
    
    
Print_GPA:
    CLR.L        D0
    
    MOVE.B       #3,D0   
    TRAP         #15     
    BSR         NEWLINE
    RTS
   
Print_GPA_LETTERGRADE:

    CMP.W   #85, D1
    BGE     GRADE_A

    CMP.W   #70, D1
    BGE     GRADE_B

    CMP.W   #50, D1
    BGE     GRADE_C

    BRA     GRADE_D
    
GRADE_A:
    LEA     A ,A1
    BRA     PRINT_GRADE_CHAR

GRADE_B:
    LEA     B ,A1
    BRA     PRINT_GRADE_CHAR

GRADE_C:
    LEA     C ,A1
    BRA     PRINT_GRADE_CHAR

GRADE_D:
    LEA     D ,A1
    BRA     PRINT_GRADE_CHAR
    
PRINT_GRADE_CHAR:
    CLR.L   D0
    MOVE.B  #13, D0      
    TRAP    #15
    RTS
    
PRINT_HONOR:
    LEA     Student1, A0      

LOOP:
   
    MOVE.W  (GPA, A0), D1     
    CMP.W   #90, D1           
    BLE     SKIP_HONOR        

    ; Print ID
    MOVE.L  (ID, A0), D1
    BSR     Print_ID

    ; Print Name
    LEA     (NAME, A0), A1
    BSR     Print_NAME

    ; Print GPA
    CLR.L   D1
    MOVE.W  (GPA, A0), D1
    BSR     Print_GPA
    BSR     NEWLINE


SKIP_HONOR:
    TST.L (A0)
    BEQ    EXIT_HONOR 
    MOVEA.L (A0), A0          
    BRA     LOOP        
 
EXIT_HONOR:
    RTS
    

    
    
    
SEARCH:
    LEA     Student1, A0      

SEARCH_LOOP:
    ;TST.L   (A0)                
    ;BEQ     NOT_FOUND
    
    MOVE.L  (ID, A0), D1      
    CMP.L   D2, D1            
    BEQ     FOUND 
    TST.L   (A0)                
    BEQ     NOT_FOUND
            
    MOVEA.L (A0), A0          
    BRA     SEARCH_LOOP  

         
FOUND:
    ; Print "ID Found"
    LEA     FOUND_MSG, A1
    MOVE    #14, D0
    TRAP    #15
    BSR     NEWLINE
    
    ; Print ID
    MOVE.L  (ID, A0), D1
    BSR     Print_ID

    ; Print Name
    LEA     (NAME, A0), A1
    BSR     Print_NAME

    ; Print GPA
    CLR.L   D1
    MOVE.W  (GPA, A0), D1
    BSR     Print_GPA
    BSR     NEWLINE
    RTS
    
NOT_FOUND:
    ; Print "ID Not Found"
    LEA     NOTFOUND_MSG, A1
    MOVE    #14, D0
    TRAP    #15
    BSR     NEWLINE
    BSR     NEWLINE
    RTS
    
FOUND_MSG       DC.B    'ID Found', 0
NOTFOUND_MSG    DC.B    'ID Not Found', 0

  
EXIT
    SIMHALT             ; halt simulator

* Put variables and constants here
* LinkedList data structure setup
            ORG     $2000
            
Student1    DC.L    Student2
            DC.L    202300067
            DC.W    95
            DC.B    'Abbas Aoun' , 0
            
Student2    DC.L    Student3
            DC.L    202305067
            DC.W    75
            DC.B    'Hussein Itani' , 0
            
Student3    DC.L    Student4
            DC.L    202356745
            DC.W    0
            DC.B    'Mohamed Darwish' , 0
            
Student4    DC.L    0
            DC.L    202300313
            DC.W    91
            DC.B    'Hussein Shaalan' , 0  


HONOR_MESSAGE    DC.B   'The honor students are: ',0   
ENTERING_MESSAGE DC.B   'Enter an ID to check, or enter 0 to exit: ',0      
   

NEXT        EQU     0
ID          EQU     4
GPA         EQU     8
NAME        EQU     10
CRLF        DC.B    0
A           DC.B    'A',0
B           DC.B    'B',0
C           DC.B    'C',0
D           DC.B    'D',0


    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
