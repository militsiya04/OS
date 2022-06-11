.model small
.stack 100h       
.data

mesg db "NACHINAEM!$"

.code                   
start:
mov AX, @data        
mov DS, AX          
mov AH, 09h             
mov DX, offset mesg     
int 21h             
mov AH, 4Ch             
mov Al, 0           
int 21h                     
end start           
