# ZJU CS/SE Undergraduate Design LaTeX Template

> 浙江大学计算机科学与技术、软件工程专业本科毕业设计 LaTeX 模板

Updated to the new style requirements in 2017.

## Dependencies

Arch Linux:

```bash
sudo pacman -S texlive-most texlive-langchinese
```

## Fonts

Execute `./install-fonts.sh`, which copies and installs fonts from a Windows partition.

## Build

In one of the sub-directories, execute `make`, which invokes `latexmk`.

## Clean

In one of the sub-directories, execute `make clean`, which removes all files ignored by `git`.
