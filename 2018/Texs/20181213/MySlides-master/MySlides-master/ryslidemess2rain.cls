% ryslidemess2rain.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidemess2rain}[2013/11/05 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% set screen size
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={32mm,4mm},vmargin={20pt,20pt},%
                headheight=13pt,headsep=7pt,footskip=7pt]%
               {geometry}
% define colors
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{39,72,98}
\definecolor{mygreen}{RGB}{23,44,60}
\definecolor{mylightgreen}{RGB}{230,179,61}
\definecolor{myorange}{RGB}{217,104,49}
\definecolor{mydarkorange}{RGB}{153,80,84}
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
\lhead{\small\color{black!50}\mythetitle}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\small\sf\color{black!50}\theauthor}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% set formats for title and tableofcontents
\renewcommand\contentsname{Outline}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}
  {} % format for both label and section name
  {} % format for labe only
  {-6ex}
  {\color{black!50}\fontsize{60}{10}\usefont{OT1}{pzc}{m}{n}\selectfont%
   \thesection\filleft\\%
   \color{myorange}\Large\sf\filleft}
  % here \thesection set the label of Outline as 0
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{gray}\Large\usefont{OT1}{pzc}{m}{n}\thecontentslabel}%
               \sf}
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
      \pgfmathrandominteger{\r}{5}{10}
      \ifthenelse{\i>\thepage}%
                 {\def\couleur{gray}\def\thk{1pt}}%
                 {\def\couleur{mydarkorange}\def\thk{2pt}}
      \ifthenelse{\i=\totvalue{page}}%
                 {\def\mysym{.}}% show a full stop for the last slide
                 {\def\mysym{,}}% show a comma for each slide but not the last
      \node at (0.1*\x,0.1*\y)
        [text=\couleur,scale=\r,font=\normalsize\normalfont,opacity=0.5]
        {\mysym};
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
    \renewcommand{\thefootnote}{\color{mylightgreen}$\infty$}
    {\centering\color{mylightgreen}\normalsize$\Sigma\,Thanks^\infty$\\}
    \vfill%
}
% EOF
