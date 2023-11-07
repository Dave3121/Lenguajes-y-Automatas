; Autor: David Arturo Gutiérrez Lugo
; 06/11/2023 11:14:52 p. m.
include 'emu8086.inc'
org 100h
print 'Hola, ingresa un numero: '
call scan_num
MOV i, CX
MOV AX,CX
printn ''
print 'El numero es: '
call print_num
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
END
