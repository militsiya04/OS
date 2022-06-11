.model small	
.stack 100h		
.data		
message_1 db 0dh,'Initial array: $',0ah,0dh
message_2 db 0ah,0dh,'Changed array: $',0ah,0dh
array dw 1, 2, 3, 4, 5, 6
dw 7, 8, 9, 10, 11, 12
dw 13, 14, 15, 16, 17, 18
dw 19, 20, 21, 22, 23, 24
a dw 3
b dw 12
x dw ?			
counter dw 0		
variant dw 0			 
CR_LF db 0dh,0ah, '$'	

.code			
start:			
mov ax,@data	
mov ds,ax		
xor ax,ax 		

mov ah, 09h			
lea dx, message_1		
int 21h			
jmp @line			

@output_of_array:
mov ax, array[si]		
cmp counter, 24		
je @sec_part
jl @main

@main: 
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
mov dl, ' '		
mov ah, 2		
int 21h		

linefeeds:		
inc counter		
add si, 2		
cmp counter, 6	
je @line 
cmp counter, 12
je @line
cmp counter, 18
je @line
cmp counter, 24
je @line		
jmp @output_of_array

@line:
mov ah, 9h			     
mov dx, offset CR_LF	
int 21h			
cmp variant, 0		
je @output_of_array	
jmp @output_of_sec_array	
@sec_part:
mov ah, 09h			
lea dx, message_2 
int 21h			
mov cx, 8 			
mov si, 4		
mov ah, 9h			
mov dx, offset CR_LF 	
int 21h	

@array_filling:		
mov ax, array[si]		
add ax, b			
imul a				
mov array[si], ax		
add si, 6		
loop @array_filling	

mov si, 0			
mov counter, 0		
mov x, 0			
inc variant 			 

@output_of_sec_array:	
mov ax, array[si]		
cmp counter, 24		

je @end
jmp @main

@end: 
mov ax,4c00h	
int 21h		

end start	
