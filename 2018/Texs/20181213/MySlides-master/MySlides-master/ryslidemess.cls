% ryslidemess.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidemess}[2012/06/07 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% set screen size
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={32mm,4mm},vmargin={20pt,20pt},%
                headheight=13pt,headsep=7pt,footskip=7pt]%
               {geometry}
% define colors
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{17,63,61}
\definecolor{mygreen}{RGB}{60,79,57}
\definecolor{mylightgreen}{RGB}{179,214,110}
\definecolor{myorange}{RGB}{248,147,29}
\definecolor{mydarkorange}{RGB}{95,92,51}
% set cover page
\RequirePackage{titling}
\pretitle{\begin{center}\LARGE\sf\color{myorange}}
\posttitle{\par\end{center}\vspace{10mm}}
\preauthor{\begin{center}\large\sf\color{mylightgreen}}
\postauthor{\par\end{center}\vspace{-2mm}}
\predate{\begin{center}\small\sf\color{gray!30}}
\postdate{\par\end{center}}
%% \mythetitle is defined to substitute for \thetitle, 
%% which is defined by Package titling but redefined by Package titlesec. 
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
% set footer and header
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyheadoffset{2mm}
\fancyfootoffset{2mm}
\lhead{\small\sf\color{gray!70}\mythetitle}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\small\sf\color{gray!70}\theauthor}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% set formats for title and tableofcontents
\renewcommand\contentsname{Outline}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{\color{myorange}\Large\sf}%
                      {\color{mylightgreen}\Huge\usefont{OT1}{pzc}{m}{n}\selectfont\thesection}%
                      {0.5em}{}
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{mylightgreen}\huge\usefont{OT1}{pzc}{m}{n}\selectfont\thecontentslabel\enspace}%
               \large\sf}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% set background
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,ifthen,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}[scale=0.2]
    \clip (0,0) rectangle +(64,48);
    \fill [mydarkgreen] (0,0) rectangle +(64,48);
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \pgfmathrandominteger{\x}{0}{120}
      \pgfmathrandominteger{\y}{0}{470}
      \pgfmathrandominteger{\r}{10}{60}
      \ifthenelse{\i>\thepage}%
                 {\def\couleur{gray}\def\thk{1pt}}%
                 {\def\couleur{mydarkorange}\def\thk{2pt}}
      \draw [line width=\thk,\couleur] (0.1*\x,0.1*\y) circle (0.1*\r);
    }
    \fill [mygreen] (14,0) rectangle +(64,48);
    \end{tikzpicture}
}
% hyperref defination at last
\AtEndOfClass{
\RequirePackage[pdfpagemode=FullScreen,%
                colorlinks=true,linkcolor=gray!30]%
               {hyperref}
}%
% set global font and color
\AtBeginDocument{\color{gray!30}\small\sf}
% set \myfrontcover to show the front cover page
\newcommand{\myfrontcover}{%
    \begin{titlingpage}
      \setcounter{page}{0}%
      \maketitle
    \end{titlingpage}
    \setcounter{page}{1}
}
% set \mybackcover to show the back cover page
\newcommand{\mybackcover}{%
    \newpage\thispagestyle{empty}\vspace*{\fill}
    {\raggedleft\color{mylightgreen}\Huge\it Thank You\\}
}
% EOF
