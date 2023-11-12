; Autor: David Arturo Gutiérrez Lugo
; 12/11/2023 12:48:39 a. m.
include 'emu8086.inc'
org 100h
MOV AX, 258
PUSH AX
POP AX
; Asignacion a
MOV a, AX
MOV AX, a
PUSH AX
POP AX
;Cast de int a char
MOV BX, 256
DIV BX
MOV AX, DX
PUSH AX
POP AX
; Asignacion a
MOV a, AX
MOV AX, 8
PUSH AX
; Asignacion +=
POP AX
ADD AX, a
MOV a, AX
MOV AX, 10
PUSH AX
; Asignacion *=
POP AX
MOV BX, a
MUL BX
MOV a, AX
MOV AX, 100
PUSH AX
; Asignacion /=
POP AX
MOV BX, AX
MOV AX, a
DIV BX
MOV a, AX
print 'Valor Casteado de a: '
call print_num
printn 'Digite el valor de altura: '
call scan_num
MOV altura, CX
printn ''
printn 'while:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
; While: 1
InicioWhile1:
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinWhile1
print '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
; While: 2
InicioWhile2:
MOV AX, j
PUSH AX
MOV AX, 250
PUSH AX
MOV AX, i
PUSH AX
POP BX
POP AX
ADD AX, BX
PUSH AX
POP BX
POP AX
CMP AX, BX
JAE FinWhile2
; If: 1
MOV AX, j
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV  BX
PUSH DX
MOV AX, 0
PUSH AX
POP BX
POP AX
CMP AX, BX
JNE ElseIf1
print '-'
JMP FinElse1
ElseIf1:
print '+'
FinElse1:
INC j
MOV AX, while
JMP InicioWhile2
FinWhile2:
INC i
printn ''
MOV AX, while
JMP InicioWhile1
FinWhile1:
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
