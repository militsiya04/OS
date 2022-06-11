.model small
.stack 100h

.data
cr_lf db 0Ah, 0Dh, '
a dw 2
b dw 3
x dw ? 
buff dw ? 
message db 'Dilennya na 0', '$'

.code
start: 
mov ax, @data
mov ds, ax
mov ax, a
mov bx, b
cmp ax, bx
je @isEqual
jg @isGreater
jl @isLess

; a == b: x = -10
@isEqual:
xor ax, ax      
mov ax, -10     
mov x, ax      
jmp @outputPart 

; a > b: x = 1 - (b / a)
@isGreater:
xor ax, ax      
mov ax, b       
mov bx, a       
cmp bx, 0       
je @error       
cwd             
idiv bx        
mov buff, ax    
mov ax, 1      
sbb ax, buff    
cwd             
jmp @outputPart 

; a < b: x = (a - 5) / b
@isLess:
xor ax, ax      
mov ax, a       
cmp ax, 0       
je @error       
mov bx, b       
sbb ax, 5                     
cwd             
idiv bx         

@outputPart:                
mov x, ax       
push ax         
cmp ax, 0       
jns @num_count   
mov ah, 02h     
mov dl, '-'     
int 21h         
pop ax          
neg ax          

@num_count:
xor cx, cx      
mov bx, 10      

@dvsn:
xor dx, dx      
div bx         
push dx         
               
inc cx         
test ax, ax    
jnz @dvsn      
mov ah, 02h     

@output:
pop dx          
add dl, 30h     
int 21h         
loop @output    
jmp @end       

@error:
mov dx, offset message  
mov ah, 09h            
int 21h                

@end:           
mov ah, 4ch     
int 21h        

end start       
