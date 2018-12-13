@echo off

if "%1"=="clean" goto clean
if "%1"=="" goto compile
if "%1"=="compile" goto compile
goto error

:clean
	echo Cleaning...
	del *.aux *.pdf *.out *.toc *.log *.blg
	goto end

:compile
	echo Compiling...
	xelatex main.tex
	bibtex main.aux
	xelatex main.tex
	xelatex main.tex
	echo Compilation done.
	open main.pdf
	goto end

:error
	echo Error argument(s), type make clean or make to clean/compile
	goto end

:end