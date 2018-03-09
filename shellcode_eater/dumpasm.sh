#!/bin/sh

nasm -f elf64 $1 -o foogarb
objdump -zd foogarb | grep -oP "[a-f0-9]{1,2}:\s+([a-f0-9]{2}\s+)*" | grep -oP "[a-f0-9]{2}[^:]" | tr -d "[:space:]"
echo ""
rm -rf foogarb
