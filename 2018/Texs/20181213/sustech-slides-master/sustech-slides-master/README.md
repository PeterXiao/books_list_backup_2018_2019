# SUSTech Beamer Template

LaTeX Beamer presentation template derived from the [MIT theme](https://github.com/jtriley/mit-beamer) by Justin Riley.

# Usage

First clone the code using `git clone https://github.com/SUSTC/sustech-slides.git`

Edit `slides.tex` to change the contents. Put all images in the `figures` directory. You can also embed videos (see `out/slides.tex` for details).

Previewing can be done by `make` with xpdf, okular, or Acrobat Reader

```
make view-xpdf
make view-okular
make view-acroread
```

The above "make view-*" commands will automatically build $HOME/mit-beamer/out/slides.pdf if necessary

For live reloading, run `python build-daemon.py`.

# Demo

See `out/slides.pdf` for demo.
