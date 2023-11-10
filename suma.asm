; Autor: David Arturo Gutiérrez Lugo
; 09/11/2023 11:51:28 p. m.
include 'emu8086.inc'
org 100h
printn 'Digite el valor de altura: '
call scan_num
MOV altura, CX
MOV AX,CX
printn ''
; Do: 1
InicioDo1:
printn 'Hola'
INC i
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JAE FinDo1
FinDo1:
int 20h
RET
define_scan_num
define_print_num
define_print_num_uns
; V a r i a b l e s
altura dw 0h
i dw 0h
j dw 0h
k dw 0h
a dw 0h
b dw 0h
END
