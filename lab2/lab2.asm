.model tiny
.stack 100h
.data
message db "NACHINAEM!$"
.code
main: mov AX, @data
      mov DS, AX
      mov AH, 09h
      mov DX, offset message
      
      int 21h
      mov AH, 4ch
      mov Al, 0
      int 21h
end main      
