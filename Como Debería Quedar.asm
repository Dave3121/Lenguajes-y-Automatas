; Autor: Guillermo Fernandez Romero
; Fecha: 3-Mayo-2023
include 'emu8086.inc'
org 100h
MOV AX, 258
PUSH AX
POP AX
; Asignacion a
mov a,AX
MOV AX, a
PUSH AX
;CAST int a char
pop ax
mov bx,256
div bx
mov ax,dx
push ax
;FIN CAST
POP AX
; Asignacion a
mov a,AX
MOV AX, 8
PUSH AX
POP AX
ADD AX,a
mov a,AX
MOV AX, 10
PUSH AX

;ASIGNACIÓN =*
POP AX
mov bx,a
mul bx
mov a,AX
MOV AX, 100
PUSH AX

;ASIGNACIÓN =/
POP AX
mov bx,ax
mov AX,a
div bx
mov a,AX
print 'Valor Casteado de a: '
MOV AX,a
call print_num
printn ''
printn ''
print 'Digite el valor de altura: '
call scan_num
mov altura,cx
printn ''
printn ''
printn 'for:'

; For: 1
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
mov i,AX
InicioFor1:
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinFor1
print ''

; For: 2
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
mov j,AX
InicioFor2:
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
JAE FinFor2

; If 1
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
JNE Elsedeif1
print '-'
JMP FinElsedeif1
Elsedeif1:
print '+'
FinElsedeif1:

INC j
JMP InicioFor2
FinFor2:

printn ''
print ''
INC i
JMP InicioFor1
FinFor1:

printn ''
printn 'while:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
mov i,AX

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
print ''
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
mov j,AX

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

; If 16
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
JNE Elsedeif16
print '-'
JMP FinElsedeif16
Elsedeif16:
print '+'
FinElsedeif16:

INC j
mov ax,j
mov j,AX
JMP InicioWhile2
FinWhile2:

INC i
mov ax,i
mov i,AX
printn ''
print ''
JMP InicioWhile1
FinWhile1:

printn ''
printn 'do:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
mov i,AX

; Do: 1
InicioDo1:
print ''
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
mov j,AX

; Do: 2
InicioDo2:

; If 31
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
JNE Elsedeif31
print '-'
JMP FinElsedeif31
Elsedeif31:
print '+'
FinElsedeif31:

INC j
mov ax,j
mov j,AX
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
JAE FinFDo2
JMP InicioDo2
FinFDo2:

INC i
mov ax,i
mov i,AX
printn ''
print ''
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinFDo1
JMP InicioDo1
FinFDo1:

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