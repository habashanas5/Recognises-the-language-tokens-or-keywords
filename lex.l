%{
#include <iostream>
#include <fstream>
using namespace std;


%}

%option noyywrap
%option yylineno
%option case-insensitive


DIGIT                   [0-9]
ID                      [a-zA-Z][a-zA-Z0-9]*
NUMBER                  {DIGIT}+((E[+-]?{DIGIT}+)?)|{DIGIT}+"."{DIGIT}*((E[+-]?{DIGIT}+)?)|{DIGIT}+"E"{DIGIT}+
OPERATOR                ("+"|"-"|"*"|"/"|">"|"<")
ASSIGNMENT              (":"|"=")
PROGRAM                 ("model"|"train"|"predict")
MODEL                   ("model"|"m_type"|"{layer}")             
M_TYPE                  ("sequential"|"convolution")
LAYER                   LAYER("type"|"in"|"out"|"activation") 
L_TYPE                  ("input"|"dense"|"output")
TRAIN                   TRAIN("data"|"labels"|"loss"|"optimizer"|"epochs"|"metrics")
ACTIVATION              ("sigmoid"|"tanh"|"relu")
LOSS                    ("mse"|"cross_entropy")
OPTIMIAER               ("adam"|"rmsprop"|"sgd")
METRIC                  ("accuracy"|"recall"|"precession")
PREDICT                 (predict)
SPICAL_CHAR             ("!"|"@"|"#"|"$"|"%"|"^"|"&"|"_")     
MYSTART                 ("program")
kEYWORDS                ("type"|"in"|"out"|"activation"|"data"|"model"|"train"|"labels"|"loss"|"optimizer"|"epochs"|"metrics"|"layer"|"if"|"then"|"begin"|"end"|"procedure"|"function"|"void"|"switch"|"union"|"static"|"while"|"do"|"return"|"goto"|"const"|"break"|"case"|"defult"|"extern"|"sizeof"|"auto"|"for"|"else"|"new"|"try"|"throw"|"catch"|"char"|"int"|"float"|"double"|"private"|"public"|"protected"|"short"|"signed"|"struct")

%%
{DIGIT}+                {cout << "An integer number: " << yytext  << " " << "(" << atoi(yytext) << ")" <<endl; }
{kEYWORDS}              {cout << "A keyword: " << yytext << endl; }
{PROGRAM}               {cout << "Program: " << yytext << endl; }
{MYSTART}               {cout << "Start symbol: " << yytext ;}
{M_TYPE}                {cout << "m_type: " << yytext << endl; }
{L_TYPE}                {cout << "l_type: " << yytext << endl; }
{ACTIVATION}            {cout << "Activation: " << yytext << endl; }
{LOSS}                  {cout << "Loss: " << yytext << endl; }
{OPTIMIAER}             {cout << "Optimizer: " << yytext << endl; }
{METRIC}                {cout << "matric: " << yytext << endl; }
{LAYER}                 {cout << "layar: " << yytext << endl;}
{TRAIN}                 {cout << "train: " << yytext << endl;}
{PREDICT}               {cout << "predict: " << yytext << endl;}
{MODEL}                 {cout << "model:" << yytext << endl;}

{ID}                    {cout << "An identifier: " << yytext << endl; }
{OPERATOR}              {cout << "An operator: " << yytext << endl; }
{NUMBER}                {cout << "A float number: " << yytext << " " << "(" << atoi(yytext) << ")" <<endl; }
{ASSIGNMENT}            {cout << "An assignment: " << yytext << endl; }
{SPICAL_CHAR}           {cout << "Special characters: " << yytext << endl; }
"("                     {cout << "Open parenthesis: " << yytext << endl; }
")"                     {cout << "Closed parenthesis: "<< yytext << endl; }
"{"                     {cout << "Left bracket: "<< yytext << endl; }
"}"                     {cout << "Right bracket: "<< yytext << endl; }
","                     {cout << "Comma: "<< yytext << endl; }
";"                     {cout << "Semicolon: "<< yytext << endl; }
"["                     {cout << "Left bracket: "<< yytext << endl; }
"]"                     {cout << "Right bracket: "<< yytext << endl; }
"\""                    {cout << "Double Quotation: "<< yytext << endl; }
\"[^\"]*\"              { cout << "String literal: " << yytext << endl; }


"/*"[\s\S]*?"*/"        { /* ignore multiline comments */ }
"//"[\s\S]*?\n          { /* ignore single-line comments */ }
[ \t\r]                 { /* ignore white space */ }
.                       { cout << "Invalid character:" << yytext << endl; }


%%

