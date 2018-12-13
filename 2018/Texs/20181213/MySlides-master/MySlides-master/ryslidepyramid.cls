% ryslidepyramid.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidepyramid3}[2013/11/28 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% set screen size
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={24mm,24mm},vmargin={16mm,16mm},%
                headheight=13pt,headsep=11mm,footskip=11mm]%
               {geometry}
% set background
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{21,49,107} % forground
\definecolor{mygreen}{RGB}{0,0,0} % background
\definecolor{mylightgreen}{RGB}{162,160,186} % for author
\definecolor{myorange}{RGB}{232,232,235} % for title
\definecolor{mydarkorange}{RGB}{86,139,252} % for shadow
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
\fancyheadoffset{12mm}
\fancyfootoffset{12mm}
\lhead{\footnotesize\color{black!50}\mythetitle}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\footnotesize\sf\color{black!50}\theauthor}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% set formats for title and tableofcontents
\renewcommand\contentsname{Outline}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}
  {} % format for both label and section name
  {} % format for labe only
  {-6ex}
  {\color{mylightgreen}\fontsize{60}{10}\usefont{OT1}{pzc}{m}{n}\selectfont%
   \thesection\filleft\\%
   \color{myorange}\Large\sf\filleft}
  % here \thesection set the label of Outline as 0
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{mylightgreen}\Large\usefont{OT1}{pzc}{m}{n}\thecontentslabel}%
               \sf}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% set background
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,ifthen,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}
    \clip (0,0) rectangle (128mm,96mm);
    \fill [mygreen] (0,0) rectangle (128mm,96mm);
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \ifthenelse{\i>\thepage}%
                 {\def\couleur{mydarkgreen}}%
                 {\def\couleur{mydarkorange}}
      \coordinate (SW) at (1.2+.6*rand,0.8+.4*rand);
      \coordinate (NW) at (1.2+.6*rand,8.8+.4*rand);
      \coordinate (SE) at (11.6+.6*rand,0.8+.4*rand);
      \coordinate (NE) at (11.6+.6*rand,8.8+.4*rand);
      \fill [opacity=.382,\couleur]
        (SW)--(NW)--(NE)--(SE)--cycle;
    }
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \coordinate (SW) at (1.2+.6*rand,0.8+.4*rand);
      \coordinate (NW) at (1.2+.6*rand,8.8+.4*rand);
      \coordinate (SE) at (11.6+.6*rand,0.8+.4*rand);
      \coordinate (NE) at (11.6+.6*rand,8.8+.4*rand);
      \ifthenelse{\i=\thepage}%
                 {\fill [opacity=.618,mygreen] (SW)--(NW)--(NE)--(SE)--cycle;}
                 {}
    }
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
    {\centering\color{mylightgreen}\normalsize The End\\}
    \vfill%
}
% EOF
