; use macros like simple function calls

; add macros to this file and
; #inlcude <macros.asm> to file you want to use these macros in

;section .data
;	newline db 10,0 ; call newline after print



	; %macros

%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro



