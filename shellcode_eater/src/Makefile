CC=gcc
CFLAGS=-std=c99
LDFLAGS=-z execstack

shellcode-eater: main.c
	$(CC) $(CFLAGS) -o shellcode-eater $(LDFLAGS) main.c

clean:
	rm -rf shellcode-eater 
