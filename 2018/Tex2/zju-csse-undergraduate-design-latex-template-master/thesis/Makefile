main:
	latexmk -xelatex -latexoption='-interaction=nonstopmode -halt-on-error' main

clean:
	latexmk -bibtex -c
	rm -f main.bbl main.nlo main.xdv
