# JGU-letter

## Purpose

This is the draft for a LaTeX-letter class for writing letters in the corporate design of the Johannes Gutenberg-University of Mainz.

It’s intended to distribute a LaTeX class file (`.cls`) in the future. However, in this very early development status, there is no class file, but letter class options (`.lco`) for the `scrlttr2` class from the [KOMA-script bundle](http://tug.ctan.org/tex-archive/macros/latex/contrib/koma-script).

The main author is [Stefan Mayer](http://github.com/stm/JGU-letter).

## How to Compile

- First, you need to place the logo file from the [ZDV](http://www.zdv.uni-mainz.de/uni-intern/vorlagen/logos/JGU-Logo_farbe_cmyk.pdf) in the subdirectory `/logo`. 
- Then adapt the personal letter class option (in this example `john-doe.lco`) according to your personal data.
- You also need the Adobe Frutiger fonts installed in LaTeX. Otherwise, you have to select a different font in line 25 of `design/jgu.lco`.

To compile, use the file `letter_jgu.tex` with `pdflatex`:

    pdflatex letter_jgu.tex

For cc and encl, you have to run pdflatex twice.
