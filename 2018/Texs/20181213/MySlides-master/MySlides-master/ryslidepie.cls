% ryslidepie.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidepie}[2012/05/14 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% set screen size
\RequirePackage[paperheight=3.78in,paperwidth=5.04in,%
                hmargin=23pt,vmargin=26pt,%
                headheight=13pt,headsep=13pt,footskip=22pt]%
               {geometry}
% set background
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}[scale=0.2]
    \fill [black!90] (-620mm,-20mm) rectangle +(640mm,480mm);
    \clip (0mm,0mm) circle (10mm);
    \filldraw [fill=black,draw=black] (0mm,0mm) circle (10mm);
    \fill [gray!30] (0mm,0mm) -- (0mm,10mm)
     arc (90:90-\thepage/\totvalue{page}*360:10mm) -- cycle;
    \fill [black!75] (0mm,0mm) circle (6.18mm); 
    \end{tikzpicture}
}
% set cover page
\RequirePackage{titling}
\pretitle{\begin{flushright}\sf\LARGE\color{white}}
\posttitle{\par\end{flushright}\vfill}
\preauthor{\begin{flushright}\sf\color{gray!30}
           \large \lineskip 0.5em%
           \begin{tabular}[t]{c}}
\postauthor{\end{tabular}\par\end{flushright}}
\predate{\begin{flushright}\normalsize\sf\color{gray!30}}
\postdate{\par\end{flushright}}
%% \mythetitle is defined to substitute for \thetitle, 
%% which is defined by Package titling but redefined by Package titlesec. 
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
% set footer and header
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyheadoffset{23pt}
\fancyfootoffset{23pt}
\lhead{\hspace{5pt}\small\sf\color{gray!70}\mythetitle\,(\theauthor)}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% set formats for title and tableofcontents
\renewcommand\contentsname{Outline}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{\color{gray!30}\Large\sf}%
                      {\color{gray!30}\Huge\usefont{OT1}{pzc}{m}{n}\selectfont\thesection}%
                      {0.5em}{}
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\huge\usefont{OT1}{pzc}{m}{n}\selectfont\thecontentslabel\enspace}%
               \large\sf}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% hyperref defination at last
\AtEndOfClass{
\RequirePackage[pdfpagemode=FullScreen,%
                colorlinks=true,linkcolor=gray!30]%
               {hyperref}
}%
% set global font and color
\AtBeginDocument{\color{white}\small\sf}
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
    {\raggedleft\color{white}\Huge\it Thank You\\}
}
% EOF