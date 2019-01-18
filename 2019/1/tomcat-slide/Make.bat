@echo off

set JOBNAME=slide
set LATEX=xelatex
set BIBTEX=bibtex

if "%1"=="" goto doc
if "%1"=="doc" goto doc
if "%1"=="depclean" goto depclean
if "%1"=="clean" (goto clean) else (goto usage)

:doc
%LATEX% %JOBNAME%
%BIBTEX% %JOBNAME%
%LATEX% %JOBNAME%
%LATEX% %JOBNAME%
goto end

:depclean
del *.pdf
goto clean

:clean
del *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc
goto end

:usage
echo %0 [doc] [clean]
goto end

:end
pause
