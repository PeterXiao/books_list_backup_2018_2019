
# What is it?
A [Beamer](https://github.com/josephwright/beamer) theme.

# Requirements
You must also install the
[Libertinus fonts](https://github.com/khaledhosny/libertinus). 
Refer to 
[these
instructions](https://www.howtogeek.com/192980/how-to-install-remove-and-manage-fonts-on-windows-mac-and-linux/)
if you don't know how to install fonts on your system.

This theme uses [fontspec](https://github.com/wspr/fontspec/) and
expects that you will typeset your slides using
[XeTeX](http://xetex.sourceforge.net/).

# Installation
Clone this repository and move the `.sty` files and `header.png` to your
`$TEXMFHOME/tex/latex` directory, creating it if it doesn't exist. If
you don't know where `$TEXMFHOME` is check your LaTeX distribution
documentation, or run `kpsewhich -var-value TEXMFHOME` in a terminal.

# Use
For basic use just put `\usetheme{iqss}` in the preamble.

A handful of new commands are provided. `\iqsssectiontitle{}` can be used to set a frame title for the section outline pages. For example, you may wish to set `iqsssectiontitle{Outline}`. In addition, colored text can be inserted using `alertb{} ... \alerte{}`. See beamer-demo.tex for examples.
