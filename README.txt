Team: (Name, UNI)
Pei-Huan Tsai, pt2630

Requirement:
C++11 compiler
I ran the program on mac


How to compile and run the program:
> bash test_all.sh

demo:
https://youtu.be/P60hEgJkftc

The output ASTs will be under "ast_outputs/" directory.


====== input cases =======

To check the resulting ast, please refer to following commands and files:
make ast-file-1  --> then check ast_outputs/output1.txt
make ast-file-2  --> then check ast_outputs/output2.txt
make ast-file-3  --> then check ast_outputs/output3.txt


To check the error handling ability of the parser, please check:
make ast-4
make ast-5

errors are shown in the terminal


=== Different input files and what is their purpose of testing ===
1. input1.hl: the register command
2. input2.hl: if else structure, keywords, and variable assignment
3. input3.hl: nested structure with a while loop, if without else
4. input4.hl: missing an operand
5. input5.hl: missing '{' for the if statement


Note that the comment line (starting with "//") is filtered, that line won't be parsed as tokens





================= rules ====================
The program starts from S

S -> PSs
PSs -> PS PSs | ε
PS -> reg_stmt | if_stmt | while_stmt

reg_stmt -> register_op ID (tu_prop_a)
tu_prop_a -> prop tu_prop_b
tu_prop_b -> ε | , prop tu_prop_b
prop -> ID: num_or_tuple
num_or_tuple -> NUM | (list_num_a)
list_num_a -> num list_num_b
list_num_b -> $ | , num list_num_b

while_stmt -> WHILE condition {general_statements}
general_statements -> general_statement general_statements | ε
general_statement -> if_stmt | BREAK | assignment | reg_stmt

if_stmt -> IF condition {statements} else_stmt
else_stmt -> ELSE {statements} | ε
condition -> ID | NUM | ID/NUM ==/!= ID/NUM | KeyWord
statements -> statement statements | ε
statement -> BREAK | assignment | reg_stmt
assignment -> ID = expr
expr -> ID | expr + ID | expr + NUM | NUM


================= Non-Terminals ============
S PSs reg_stmt if_stmt while_stmt tu_prop_a tu_prop_b prop num_or_tuple list_num_a list_num_b 
condition general_statements general_statement assignment
statements statement expr

================= Terminals ================
keyWord (including some fine-grained keywords)
    fine-grained keyword types:
        IF
        ELSE
        BREAK
        REGISTER_OP
        WHILE
Operator (including some fine-grained operator types)
    fine-grained operator types:
        EQUALS
        PLUS
        CompEqual
        CompNotEqual

ID 
NUM
COMMA (,)
COLON (:)
LPAREN ('(')
RPAREN (')')
LBRACE ('{')
RBRACE ('}')



======== files =======
scanner.cpp: source code of the scanner
tph_parser.py: source code of the parser
*.hl: programs using my own language
test_all.sh: shell scripts to execute all commands
Makefile: some targets to use




