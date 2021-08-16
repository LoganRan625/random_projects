section .data
	stopping db "loop done",10
        hello db "hello",10

section .text
	global _start

_start:
	mov rax, 1
_hello:
	push rax
	mov rdi, 10
	push rdi

	mov rax, 1
	mov rdi, 1
	mov rsi, hello
	mov rdx, 6
	syscall

	jmp _loop

_loop:
	pop rdi
	pop rax
	inc rax
	push rax
	cmp rax, rdi
	jle _hello
	cmp rax, rdi
	jg _end
_end:
	mov rax, 60
	mov rdi, 0
	syscall
