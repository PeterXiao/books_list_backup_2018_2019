DEST_DIR 	    = $(shell kpsewhich --var-value=TEXMFHOME)
INSTALL_DIR 	= $(DEST_DIR)/tex/latex/beamertheme-uds
DEMO_SRC 		= example

.PHONY: default 
default: $(ROOT).pdf

.PHONY: install
install: $(DEMO_SRC).pdf
	mkdir -p $(INSTALL_DIR)
	cp -v *.sty example.tex example.pdf $(INSTALL_DIR)

.PHONY: uninstall
uninstall:
	rm -rvf $(INSTALL_DIR)

.PHONY: example
example: $(DEMO_SRC).pdf

.PHONY: $(DEMO_SRC).pdf
$(DEMO_SRC).pdf:
	latexmk -lualatex -use-make $(DEMO_SRC).tex

.PHONY: clean
clean:
	latexmk -c
