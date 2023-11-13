; Autor: David Arturo Gutiérrez Lugo
<<<<<<< HEAD
; 12/11/2023 08:55:07 p. m.
=======
; 12/11/2023 12:48:39 a. m.
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
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
<<<<<<< HEAD
printn ''
=======
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
printn 'Digite el valor de altura: '
call scan_num
MOV altura, CX
printn ''
<<<<<<< HEAD
printn 'for:'
; For: 1
=======
printn 'while:'
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
<<<<<<< HEAD
InicioFor1:
=======
; While: 1
InicioWhile1:
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
<<<<<<< HEAD
JA FinFor1
print '	'
; For: 2
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
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
JMP InicioFor2
FinFor2:
print '
'
INC i
JMP InicioFor1
FinFor1:
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
=======
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
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
<<<<<<< HEAD
; If: 2
=======
; If: 1
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
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
<<<<<<< HEAD
JNE ElseIf2
print '-'
JMP FinElse2
ElseIf2:
print '+'
FinElse2:
INC j
JMP InicioWhile2
FinWhile2:
INC i
print '
'
JMP InicioWhile1
FinWhile1:
printn 'do:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
; Do: 1
InicioDo1:
print '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
; Do: 2
InicioDo2:
; If: 3
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
JNE ElseIf3
print '-'
JMP FinElse3
ElseIf3:
print '+'
FinElse3:
INC j
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
JAE FinDo2
JMP InicioDo2
FinDo2:
INC i
printn ''
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinDo1
JMP InicioDo1
FinDo1:
=======
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
>>>>>>> 4db373aab7495083a1af5bcda87a8e04d4c1f369
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
