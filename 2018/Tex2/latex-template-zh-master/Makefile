.PHONY: .

CC = xelatex
OUTPUT_DIR = output

all:
	make clean
	make pdf

pdf: 
	$(CC) -output-directory=$(OUTPUT_DIR) ./template.tex
	
clean:
	rm -rf $(OUTPUT_DIR)/*.*
