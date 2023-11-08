; Autor: David Arturo Gutiérrez Lugo
; 08/11/2023 01:50:27 p. m.
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
POP AX
; Asignacion a
MOV a, AX
MOV AX, 8
PUSH AX
ADD AX, a
POP AX
MOV AX, 10
PUSH AX
MUL a
POP AX
MOV AX, 100
PUSH AX
DIV a
POP DX
printn 'Valor Casteado de a: '
call print_num
printn 'Digite el valor de altura: '
call scan_num
MOV altura, CX
MOV AX,CX
printn ''
printn 'for:'
; For: 1
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
InicioFor1:
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinFor1
printn '	'
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
; if: 1
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
JNE Eif1
printn '-'
JMP Eif1
Eif1:
JMP Eif1
Eif1:
INC j
JMP InicioFor2
FinFor2:
printn ''
INC i
JMP InicioFor1
printn '	'
printn '-'
printn '+'
FinFor3:
printn ''
printn '	'
printn '-'
printn '+'
printn '-'
FinFor4:
printn ''
printn '	'
printn '-'
printn '+'
printn '-'
printn '+'
FinFor5:
printn ''
FinFor6:
FinFor1:
printn 'while:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
InicioWhile1:
; While: 2
MOV AX, i
PUSH AX
MOV AX, altura
PUSH AX
POP BX
POP AX
CMP AX, BX
JA FinWhile1
printn '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
InicioWhile2:
; While: 3
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
; if: 16
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
JNE Eif16
printn '-'
JMP Eif16
Eif16:
JMP Eif16
Eif16:
INC j
JNEInicioWhile2
; While: 3
FinWhile2:
INC i
printn ''
JNEInicioWhile1
; While: 3
printn '	'
; While: 4
printn '-'
; While: 4
printn '+'
; While: 4
FinWhile3:
printn ''
; While: 4
printn '	'
; While: 5
printn '-'
; While: 5
printn '+'
; While: 5
printn '-'
; While: 5
FinWhile4:
printn ''
; While: 5
printn '	'
; While: 6
printn '-'
; While: 6
printn '+'
; While: 6
printn '-'
; While: 6
printn '+'
; While: 6
FinWhile5:
printn ''
; While: 6
; While: 7
FinWhile6:
FinWhile1:
printn 'do:'
MOV AX, 1
PUSH AX
POP AX
; Asignacion i
MOV i, AX
InicioDo1:
; Do: 2
printn '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
InicioDo2:
; Do: 3
; if: 31
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
JNE Eif31
printn '-'
JMP Eif31
Eif31:
JMP Eif31
Eif31:
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
; Do: 3
printn '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
InicioDo3:
; Do: 4
; if: 32
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
JNE Eif32
printn '-'
JMP Eif32
Eif32:
JMP Eif32
Eif32:
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
JAE FinDo3
; Do: 4
; if: 33
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
JNE Eif33
JMP Eif33
Eif33:
printn '+'
JMP Eif33
Eif33:
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
JAE FinDo3
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
; Do: 4
printn '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
InicioDo4:
; Do: 5
; if: 34
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
JNE Eif34
printn '-'
JMP Eif34
Eif34:
JMP Eif34
Eif34:
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
JAE FinDo4
; Do: 5
; if: 35
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
JNE Eif35
JMP Eif35
Eif35:
printn '+'
JMP Eif35
Eif35:
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
JAE FinDo4
; Do: 5
; if: 36
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
JNE Eif36
printn '-'
JMP Eif36
Eif36:
JMP Eif36
Eif36:
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
JAE FinDo4
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
; Do: 5
printn '	'
MOV AX, 250
PUSH AX
POP AX
; Asignacion j
MOV j, AX
InicioDo5:
; Do: 6
; if: 37
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
JNE Eif37
printn '-'
JMP Eif37
Eif37:
JMP Eif37
Eif37:
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
JAE FinDo5
; Do: 6
; if: 38
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
JNE Eif38
JMP Eif38
Eif38:
printn '+'
JMP Eif38
Eif38:
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
JAE FinDo5
; Do: 6
; if: 39
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
JNE Eif39
printn '-'
JMP Eif39
Eif39:
JMP Eif39
Eif39:
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
JAE FinDo5
; Do: 6
; if: 40
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
JNE Eif40
JMP Eif40
Eif40:
printn '+'
JMP Eif40
Eif40:
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
JAE FinDo5
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
