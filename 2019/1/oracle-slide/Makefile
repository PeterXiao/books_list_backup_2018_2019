JOBNAME = slide
LATEX = xelatex
BIBTEX = bibtex

run:
	$(LATEX) $(JOBNAME)
	$(BIBTEX) $(JOBNAME)
	$(LATEX) $(JOBNAME)
	$(LATEX) $(JOBNAME)
clean:
	rm -rf *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc
depclean: clean
	rm -rf *.pdf
