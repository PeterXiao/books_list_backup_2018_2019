# LaTeX Template for Chinese

一个符合中文排版要求的 LaTeX 样式模板

## Design

继承 ctexart 文档类的样式，加上一些额外的中文排版样式，使之更加适用于互联网文章排版。

## Demo

[https://latex.joway.io/](https://latex.joway.io/)

## Usage

1. 下载 zhtypo.sty 样式文件 [http://latex.joway.io/styles/zhtypo.sty](http://latex.joway.io/styles/zhtypo.sty)
2. 引入 sty 文件 , 样例参见 template.tex 文件

	```tex
    \documentclass[12pt, UTF8, heading = false, scheme = plain]{ctexart}
    \usepackage{styles/zhtypo}
	
    \title{LaTeX 介绍}
    \author{维基百科}
    \date{\today}
	
    \begin{document}
    \maketitle
    
    % ...
    
    \end{document}
	```

3. 默认样式:
	- 冬青字体
	- 1.5倍行间距
	- 0.5 baseline 段间距
    - 中英文间自动空格
