% ryslidevideo.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidevideo}[2012/07/25 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% set screen size
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin=38pt,vmargin=26pt,%
                headheight=13pt,headsep=13pt,footskip=22pt]%
               {geometry}
% set background
\RequirePackage{tikz,eso-pic,makecell}
\usetikzlibrary{positioning}
\newcommand{\mypage}{%
\begin{tikzpicture}[remember picture,overlay]
    \pgfmathrandominteger{\a}{0}{255}
    \pgfmathrandominteger{\b}{0}{255}
    \pgfmathrandominteger{\c}{0}{255}
    \definecolor{myframecolor}{RGB}{\a,\b,\c}
    \shade [top color=myframecolor!50!black,bottom color=black]
           (0,0) rectangle +(128mm,96mm);
    \fill [white,rounded corners=5mm]
          (5mm,5mm) rectangle +(118mm,86mm);
\end{tikzpicture}
}
\AddToShipoutPicture{\mypage}
% set cover page
\RequirePackage{titling}
%% \mythetitle is defined to substitute for \thetitle, 
%% which is defined by Package titling but redefined by Package titlesec. 
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
% set footer and header
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyheadoffset{35pt}
\fancyfootoffset{35pt}
\lhead{\color{gray!50}\small\sf\mythetitle}
\chead{}
\rhead{\color{gray!50}\small\sf\theauthor}
\lfoot{}
\rfoot{}
\cfoot{\begin{tikzpicture}
       \draw [gray!50,line cap=round,line width=3pt]
             (0,0) -- +(50mm,0mm);
       \draw [gray!50!black,line cap=round,line width=3pt]
             (0,0) -- +(\thepage/\totvalue{page}*50mm,0mm);
       \end{tikzpicture}%
      }
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% set formats for title and tableofcontents
\renewcommand\contentsname{Outline}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{}%
                      {}%
                      {0pt}%
                      {\color{black!38}\fontsize{90}{10}\usefont{OT1}{pzc}{m}{n}\selectfont%
					   \thesection\centering\\
                       \color{black!62}\huge\sf\centering}
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\LARGE\it\color{black!38}\thecontentslabel\hspace{0.3em}}%
               \large\sf}
              {\contentsmargin{0pt}}
              {}
% hyperref defination at last
\AtEndOfClass{
\RequirePackage[pdfpagemode=FullScreen,%
                colorlinks=true,menucolor=gray,linkcolor=green!50!black]%
               {hyperref}
}%
% set global font and color
\AtBeginDocument{\small\sf}
% set \myfrontcover to show the front cover page
\newcommand{\myfrontcover}{
  \begin{titlingpage}
  \setcounter{page}{-1}
  \begin{tikzpicture}[remember picture,overlay]
    \node (Title) at (current page.center)
    [yshift=10mm,inner sep=20pt,font=\huge\sf]
    {\mythetitle};
    \node (Author) at (current page.center)
    [yshift=-15mm,inner sep=7pt,font=\large\sf]
    {\makecell{\theauthor\\\thedate}};
    \node (start) at (current page.center)
    [circle,inner sep=2cm,opacity=0.6,scale=0.25,%
     top color=white,bottom color=black!25]
    {\begin{tikzpicture}[smooth cycle,fill=green!50!black]
      \fill plot[tension=0] coordinates{(-2.887,-5) (-2.887,5) (5.774,0)};
      %\fill [green] (0,0) -- (0,10) -- (8.66,5);
     \end{tikzpicture}
    };
  \end{tikzpicture}
  \end{titlingpage}
  \setcounter{page}{0}
}
% set \mybackcover to show the back cover page
\newcommand{\mybackcover}{
  \newpage\thispagestyle{empty}
  \addtocounter{page}{-1}
  \begin{tikzpicture}[remember picture,overlay]
    \node (Thanks) at (current page.center)
    [circle,inner sep=5mm,opacity=0.6,scale=0.25,%
     top color=white,bottom color=black!25]
    {\begin{tikzpicture}[red,line cap=round,line width=7mm]
      \draw (-2.5,4.33) arc(120:420:5);
      \draw (0,2) -- (0,6);
     \end{tikzpicture}
    };
  \end{tikzpicture}
}
