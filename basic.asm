include "macro"

section .data
	text db "string" 10,0

section .text
	global _start

_start:
	mov rax, 1
	mov rsi, 1
	mov rdi, text
	mov rdx, 6
	syscall

	exit


