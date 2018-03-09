#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main(int argc, char **argv) {
    if (argc != 2) {
        printf("Please provide shellcode input\n");
        printf("example usage:\n./shellcode-eater \"cccccc\"\n");
        exit(1);
    }

    char *data = argv[1];
    size_t datalen = strlen(data);
    char *code = malloc(datalen / 2);

    int j = 0;
    char tmp[3] = {0};
    for (int i = 0; i < datalen; i += 2) {
        tmp[0] = data[i];
        tmp[1] = data[i + 1];
        long number = strtol(tmp, NULL, 16);
        code[j] = (char)number;
        j++;
    }

    int (*func)();
    func = (int (*)())code;
    (int)(*func)();

    free(code);
}
