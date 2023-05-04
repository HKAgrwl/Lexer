#!/bin/bash

bison -y -d bracket.y
flex bracket.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o bracket.exe
./bracket.exe


