#include <iostream>
#include <fstream>
#include "lex.yy.c" 
using namespace std;

// Flex/Bison variable for input file
extern FILE* yyin; 

int main() {
   // Open the input file using an ifstream
   ifstream inputFile("input.txt");
    if (!inputFile.is_open()) {
        cerr << "Error: Unable to open the input file." << endl;
        return 1;
    }

    // Convert the ifstream to a FILE*
    FILE* filePtr = fopen("input.txt", "r");
    if (!filePtr) {
        cerr << "Error: Unable to convert ifstream to FILE*." << endl;
        return 1;
    }

    // Redirect input stream to the input file (FILE*)
    yyin = filePtr;

    // Call the lexer
    yylex();


    fclose(filePtr);
    

    return 0;
}

