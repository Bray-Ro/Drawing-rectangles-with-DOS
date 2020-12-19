; constants
RECTX EQU 0Ch
RECTY EQU 0Ch
RECTHEIGHT EQU 5
RECTWIDTH EQU 5




drawRect:
	MOV SI, RECTX

        INCSI:
        	ADD SI, 1
                MOV BX, 0
                JMP lines
        lines:
     	      MOV AX, 0
       	      MOV AL, 1
              MOV BH, 00h
              MOV CX, SI
              MOV DX, BX
              MOV AH, 0Ch
              INT 10h	
              ADD BX, 1      ; Increment


              CMP BX,RECTHEIGHT    ; Compare BX to the limit
              JLE lines   ; Loop while less or equal
              ADD DI, 1
              CMP DI, RECTWIDTH
              JLE INCSI              
              JMP afterRect
        	
        

        
  
       
        
start:
	; Set up graphics mode
	MOV AL, 13
        MOV AH, 00h
        INT 10h
        
    	
        ; Set Background colour
        MOV BL, 0
        MOV AH, 0Bh
        INT 10h
	


    	
	JMP drawRect
       	afterRect:
        	

exit:

    RET
