all: scanner
	g++ -std=c++11 -o scanner scanner.cpp -Wall
scanner: scanner.cpp
	g++ -std=c++11 -o scanner scanner.cpp -Wall
tokens: scanner
	./scanner example_inputs/simple1.hl -o tokenized_inputs/simple1.txt
	./scanner example_inputs/simple2.hl -o tokenized_inputs/simple2.txt
	./scanner example_inputs/simple3.hl -o tokenized_inputs/simple3.txt
	./scanner example_inputs/simple4.hl -o tokenized_inputs/simple4.txt
	./scanner example_inputs/simple5.hl -o tokenized_inputs/simple5.txt

ast: tokens
	python3 tph_parser.py tokenized_inputs/simple1.txt
	python3 tph_parser.py tokenized_inputs/simple2.txt
	python3 tph_parser.py tokenized_inputs/simple3.txt
	python3 tph_parser.py tokenized_inputs/simple4.txt
	python3 tph_parser.py tokenized_inputs/simple5.txt

ast-1: tokens
	python3 tph_parser.py tokenized_inputs/simple1.txt
ast-2: tokens
	python3 tph_parser.py tokenized_inputs/simple2.txt
ast-3: tokens
	python3 tph_parser.py tokenized_inputs/simple3.txt
ast-4: tokens
	python3 tph_parser.py tokenized_inputs/simple4.txt
ast-5: tokens
	python3 tph_parser.py tokenized_inputs/simple5.txt

ast-files: tokens
	python3 tph_parser.py tokenized_inputs/simple1.txt -o ast_outputs/output1.txt
	python3 tph_parser.py tokenized_inputs/simple2.txt -o ast_outputs/output2.txt
	python3 tph_parser.py tokenized_inputs/simple3.txt -o ast_outputs/output3.txt
	python3 tph_parser.py tokenized_inputs/simple4.txt -o ast_outputs/output4.txt
	python3 tph_parser.py tokenized_inputs/simple5.txt -o ast_outputs/output5.txt

ast-file-1: tokens
	python3 tph_parser.py tokenized_inputs/simple1.txt -o ast_outputs/output1.txt
ast-file-2: tokens
	python3 tph_parser.py tokenized_inputs/simple2.txt -o ast_outputs/output2.txt
ast-file-3:	tokens
	python3 tph_parser.py tokenized_inputs/simple3.txt -o ast_outputs/output3.txt
ast-file-4: tokens
	python3 tph_parser.py tokenized_inputs/simple4.txt -o ast_outputs/output4.txt
ast-file-5: tokens
	python3 tph_parser.py tokenized_inputs/simple5.txt -o ast_outputs/output5.txt



clean:
	rm -f scanner
	rm -rf tokenized_inputs/*
	rm -rf ast_outputs/*