section .text
	global _start
_start:
	xor rax,rax
	add al,0x99  ;; vhangup()
	syscall

	xor rax,rax  
	add al,0x3c  ;; exit()
	syscall
