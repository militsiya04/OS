.model small
.stack 100h
.data
    s1 db "A"
    s2 db "M"
    s3 db "8"
    s4 db "2"
    String db 20 dup("1") 
    CR_LF db 0dh,0ah, '$' 

.code
start:
    mov ax, @data 
    mov ds, ax   

; AM82
    mov al, s1 
    mov String, al 
    mov al, s2
    mov String+1, al
    mov al, s3
    mov String+2, al
    mov al, s4
    mov String+3, al
; AM82AM82
    mov al, s1
    mov String+4, al 
    mov al, s2
    mov String+5, al
    mov al, s3
    mov String+6, al
    mov al, s4
    mov String+7, al
; AM82AM82AM82
    mov al, s1
    mov String+8, al 
    mov al, s2
    mov String+9, al
    mov al, s3
    mov String+10, al
    mov al, s4
    mov String+11, al
; AM82AM82AM82AM82
    mov al, s1
    mov String+12, al 
    mov al, s2
    mov String+13, al
    mov al, s3
    mov String+14, al
    mov al, s4
    mov String+15, al
; AM82AM82AM82AM82AM82
    mov al, s1
    mov String+16, al 
    mov al, s2
    mov String+17, al
    mov al, s3
    mov String+18, al
    mov al, s4
    mov String+19, al

    mov ah, 40h     
    mov bx, 1      
    mov cx, 20      
    lea dx, String  
    int 21h         

    mov ah, 9h           
    mov dx, offset CR_LF  
    int 21h               
    
    mov ah, 4ch  
    int 21h      

end start
