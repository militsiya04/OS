.model small
.stack 100h
.data
a dw 16
b dw 8
c dw 9 
d dw 6 
e dw 2 
f dw 3 
g dw 4 
buff dw ?
denominator dw ?
z dw ? 
message db 'Error! Devision by zero.$' 

.code
start: 			
mov ax, @data 		
mov ds, ax 			   
mov ax, a		
cwd			
idiv g			
mov buff, ax		
mov ax, b		
cwd			
sbb ax, buff		
cmp ax, 0		
je @error		
mov denominator, ax	

mov ax, c		
cwd			
imul e			
mov buff, ax	
mov ax, d		
cwd			
idiv f			
sbb buff, ax		
cwd			
mov ax, buff		


idiv denominator	
mov z, ax 		

xor ax,ax 		
mov ax, z 		
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
