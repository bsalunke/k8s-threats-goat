#!/bin/sh
echo "Starting Compilation..."

if command -v gcc &> /dev/null; then
    echo "Compiling C program..."
    echo '#include <stdio.h>\nint main() { printf("Hello from C program!\\n"); return 0; }' > test.c
    gcc test.c -o test
    ./test
elif command -v go &> /dev/null; then
    echo "Compiling Go program..."
    echo 'package main\nimport "fmt"\nfunc main() { fmt.Println("Hello from Go program!") }' > test.go
    go build test.go
    ./test
elif command -v javac &> /dev/null; then
    echo "Compiling Java program..."
    echo 'public class Test { public static void main(String[] args) { System.out.println("Hello from Java program!"); } }' > Test.java
    javac Test.java
    java Test
fi

