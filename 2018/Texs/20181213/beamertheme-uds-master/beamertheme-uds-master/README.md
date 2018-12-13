beamertheme-uds
==============================================================================

A LaTeX beamer theme complying with the corporate design of University of
Saarland. 


Installation
------------------------------------------------------------------------------

Installation is done by coping the files from this repository into the
`texmf/tex/latex` folder. The location of these folders may vary depending on
operating system and tex distribution. `make install` will do this for you.
Another possibility is to place the files into your latex working directory.

The template can be used by `pdflatex`, `xetex` or `lualatex`.


Usage
------------------------------------------------------------------------------

This beamer template can be loaded using the theme command:
```tex
\usetheme[]{UdS}
// or choose only specific themes:
\useoutertheme[]{UdS}
\useinnertheme[]{UdS}
\usecolortheme[]{UdS}
\usefonttheme[]{UdS}

```

A working example is `example.tex` in this repository (written for LuaLaTeX).
The example file can be compiled with `make example`.


## Replacing default images

Default images can be replaced by placing images with the same name in the
latex working directory. Image names are (images with .png, .pdf, .jpg, .eps
extensions are loadable):
* `front-picture` to replace the image on the title page
* `logoUdS` to replace the University of Saarland icon in the top right corner


## Options

Only the outer theme has some options. Defaults are given after the equal
sign.

### Outer theme

* `udsicon=true` (boolean): Specifies whether a University of Saarland icon is
  placed in the right upper corner.
* `footline=true` (boolean): Enable/disable footline.
* `footlinetext` (string): Which text should be shown in the middle of the
  footline. Put strings with spaces in parantheses: `footlinetext={example
  presentation}`
* `titlepagehead=true` (boolean): Enable/disable headline on title page.
* `titlepagepic=true` (boolean): Show/hide default picture on title page.


Issues and contributions
------------------------------------------------------------------------------

Please report all issues to [this Github
page](https://github.com/mutlusun/beamertheme-uds/issues), do not contact the
press team of University of Saarland. All contributions are welcome.


Licence
------------------------------------------------------------------------------

All source code is licensed under the BSD-2-Clause Licence. 

ALL IMAGES ARE PROTECTED BY COPYRIGHT. COPYRIGHT HOLDER IS UNIVERSITY OF
SAARLAND.
