\def\sci@fileversion{1.03}
\def\sci@filedate{2015/2/10}
\def\@journal{Sci China Inf Sci}
\def\@issn{1674-733X}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{SCIS2015cn}[\sci@filedate, \sci@fileversion]

\let\CCTCJKfonts=1
\LoadClass[twoside,CJK]{ctexart}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,upgreek,multicol,mathrsfs,pifont,amscd,latexsym,geometry,color,fancyhdr}
%% graphics packages
\RequirePackage{graphicx,picins}
%% other packages
\RequirePackage{algorithm,algorithmic,tabularx,url,float,booktabs}
%% check pdfTeX mode
\RequirePackage{ifpdf}
\RequirePackage{fancyhdr,lastpage}
\RequirePackage{supertabular}


%-------------------------- Page layout ------------------------------
\textwidth=160truemm
\textheight=218truemm
\topmargin=-10pt
\headsep=7truemm
\oddsidemargin=2pt
\evensidemargin=2pt
\parindent=22pt
\footskip=10mm
\renewcommand{\baselinestretch}{1.3}
\renewcommand{\arraystretch}{1.2}
\newcommand{\sanhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{2\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10pt}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{7pt}{\baselineskip}\selectfont}
\newcommand{\jiuhao}{\fontsize{9pt}{0.8\baselineskip}\selectfont}
\newcommand{\shihao}{\fontsize{6pt}{0.8\baselineskip}\selectfont}
\newcommand{\zhaiyao}{\fontsize{9.3pt}{0.76\baselineskip}\selectfont}

%-------------------- Article Information ----------------------------
\def\ArticleType#1#2#3{
    \noindent
    \begin{picture}(0,0)
        \put(0,0){\fcolorbox[rgb]{1,1,1}{0.75,0.75,0.75}
        {\parbox[c][5mm]{#1}{\begin{center}\heiti\zihao{-4}#2\end{center}}}}
        #3
    \end{picture}
}

\let\@Year\@empty \def\Year#1{\def\@Year{#1}}
\let\@Vol\@empty \def\Vol#1{\def\@Vol{#1}}
\let\@No\@empty \def\No#1{\def\@No{#1}}
\let\@AuthorMark\@empty \def\AuthorMark#1{\def\@AuthorMark{#1}}
\let\@AuthorCitation\@empty \def\AuthorCitation#1{\def\@AuthorCitation{#1}}
\let\@BeginPage\@empty \def\BeginPage#1{\def\@BeginPage{#1}}
\let\@EndPage\@empty \def\EndPage#1{\def\@EndPage{#1}}
\let\@DOI\@empty \def\DOI#1{\def\@DOI{#1}}
\let\@ReceiveDate\@empty \def\ReceiveDate#1{\def\@ReceiveDate{#1}}
\let\@AcceptDate\@empty \def\AcceptDate#1{\def\@AcceptDate{#1}}
\let\@OnlineDate\@empty \def\OnlineDate#1{\def\@OnlineDate{#1}}
\let\@Foundation\@empty \def\Foundation#1{\def\@Foundation{#1}}
\let\@comment\@empty \def\comment#1{\def\@comment{#1}}
\let\@entitle\@empty \def\entitle#1{\def\@entitle{#1}}
\let\@enabstract\@empty \def\enabstract#1{\def\@enabstract{#1}}
\let\@enkeywords\@empty \def\enkeywords#1{\def\@enkeywords{#1}}
\let\@encomment\@empty \def\encomment#1{\def\@encomment{#1}}

%-------------------------- Title ------------------------------------
\let\@title\@empty 
\renewcommand\title[2]{
    \def\@title{\bfseries\huge\heiti\zihao{2}#1}
    \def\@titlehead{#2}
    \ifx\@titlehead\@empty\def\@titlehead{#1}\fi
    \def\@titlecitation{#2}
    \ifx\@titlecitation\@empty\def\@titlecitation{#1}\fi
}

\let\@author\@empty
\let\@authoremaillist\@empty
\let\@onlyoneauthor\@empty
\renewcommand*{\author}[3][]{%
  \ifx \@author\@empty
    \def\@author{#2\@authornote{#1}{#3}}
  \else
    \def\@onlyoneauthor{No}
    \expandafter\def\expandafter\@author\expandafter
      {\@author,\,\, #2\@authornote{#1}{#3}}
  \fi
  \ifx#3\@empty\else
      \ifx\@authoremaillist\@empty \def\@authoremaillist{#3}
      \else \expandafter\def\expandafter\@authoremaillist\expandafter{\@authoremaillist,~#3}
      \fi
  \fi
}

\let\@enauthor\@empty
\newcommand*{\enauthor}[3][]{%
  \ifx \@enauthor\@empty
    \def\@enauthor{#2\@enauthornote{#1}{#3}}
    \let\@enauthortemp\@enauthor
  \else
    \let\@enauthor\@enauthortemp
    \expandafter\def\expandafter\@enauthor\expandafter
      {\@enauthor~{\&}~#2\@enauthornote{#1}{#3}}
    \expandafter\def\expandafter\@enauthortemp\expandafter
      {\@enauthortemp,~#2\@enauthornote{#1}{#3}}
  \fi
}

\def\@authornote#1#2{%  
  \ifx#1\@empty
  \else \textsuperscript{\footnotesize #1}%
  \fi
  
  \ifx#2\@empty
  \else
    \ifx\@onlyoneauthor\@empty
    \else \textsuperscript{\raisebox{-2pt}[0mm][0mm]{*}}%
    \fi
  \fi
}

\def\@enauthornote#1#2{%  
  \ifx#1\@empty
  \else \textsuperscript{#1}%
  \fi
  
  \ifx#2\@empty
  \else
    \ifx\@onlyoneauthor\@empty
    \else \textsuperscript{\raisebox{-2pt}[0mm][0mm]{*}}%
    \fi
  \fi
}

\def\@address{}
\newcommand*{\address}[2][]{
    \def\@addressnote{#1}
  \ifx\@address\@empty
    \ifx\@addressnote\@empty
        \def\@address{#2}
    \else
        \def\@address{#1~#2}
    \fi
  \else
    \ifx\@addressnote\@empty
        \expandafter\def\expandafter\@address\expandafter
        {\@address\\{#2}}
    \else
        \expandafter\def\expandafter\@address\expandafter
        {\@address\\{#1~#2}}
    \fi
  \fi}


\def\@enaddress{}
\newcommand*{\enaddress}[2][]{
    \def\@enaddressnote{#1}
  \ifx \@enaddress\@empty
    \ifx\@enaddressnote\@empty
        \def\@enaddress{{\it #2}}
    \else
        \def\@enaddress{#1~{\it #2}}
    \fi
  \else
    \ifx\@enaddressnote\@empty
        \expandafter\def\expandafter\@enaddress\expandafter
        {\@enaddress;\\{\it #2}}
    \else
        \expandafter\def\expandafter\@enaddress\expandafter
        {\@enaddress;\\{#1~{\it #2}}}
    \fi
  \fi}

\def\@foundation{}
\newcommand*{\foundation}[1]{
  \def\SCAE@foundation{#1}
  \ifx\SCAE@foundation\@empty
  \else  
    \def\@foundation{\footnotetext{#1}}
  \fi
}




\renewcommand\maketitle{
    \begingroup
    %首页页眉
    \vspace*{-15mm}\noindent
    \parbox[c]{120mm}{
        {\small\songti\bahao
            中国科学\,: 信息科学\hspace{5mm}在审文章}
        \vspace{1.5truemm} 
        \hrule depth0pt height0.25truemm width 160 truemm
        \vspace{1.5truemm} 
        {\sf\zihao{-5}}
    }\hspace{-2mm}
    %\parbox[c]{38mm}{\hfill}
    %首页页脚
    \begin{picture}(0,0)
        \put(-451,-663){\fcolorbox[rgb]{0,0,0}{0.75,0.75,0.75}
        {\parbox[t]{144truemm{\bf\scriptsize 引用格式:\ }}
        {\scriptsize \@AuthorCitation.~\@titlecitation.~中国科学: 信息科学,
        ~\@Year,~\@Vol:~\@BeginPage--\@EndPage,~doi:~\@DOI}}}
    \end{picture}
    \endgroup

    
    \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
        \long\def\@makefntext##1{\noindent\@textsuperscript{\normalfont\@thefnmark}##1}%
        \@maketitle
        \thispagestyle{empty}\@thanks
        \long\def\@makefntext##1{\noindent##1}%
    \endgroup
    \renewcommand\thefootnote{\arabic{footnote}}
    \setcounter{footnote}{0}
    \setcounter{page}{\@BeginPage}
}
\long\def\@makefntext#1{\parindent 7mm \indent\hbox{\hss{\@thefnmark)\ }}\baselineskip 10pt #1}
\def\@makefnmark{\hbox\textsuperscript{\@thefnmark)}}

\def\@maketitle{
  \begingroup\noindent
    \vspace{10truemm}
    \begin{flushleft}
        %标题
        \renewcommand{\baselinestretch}{0.9}
        \@title
    \end{flushleft}
    \vskip 4 true mm
    \begin{flushleft}
        %作者
        \renewcommand{\baselinestretch}{0.9}
        {\rmfamily\Large\kaishu\zihao{4}
            \begin{tabular}[t]{@{}l@{}}\@author\end{tabular}}
    \end{flushleft}
    \vspace{-3mm}
    \begin{flushleft}
        \renewcommand{\baselinestretch}{1.35}
        \rmfamily\footnotesize\songti\zihao{6}
        %单位
        \@address\\
        %email
        \ifx \@onlyoneauthor \@empty
            E-mail:~\@authoremaillist
        \else
            *~通信作者.~E-mail:~\@authoremaillist
        \fi
        %其他信息
        \ifx \@comment \@empty
        \else
            \\ \@comment
        \fi
    \end{flushleft}
    \vspace{-3mm}
    \begin{flushleft}
        \renewcommand{\baselinestretch}{1.2}
        \rmfamily\footnotesize\songti\zihao{6}
        %日期
        收稿日期:~\@ReceiveDate;\ \ 接受日期:~\@AcceptDate
        \ifx \@OnlineDate \@empty
        \else
            ;\ \ 网络出版日期:~\@OnlineDate
        \fi
        %资助
        \ifx \@Foundation \@empty
        \else
            \\ \@Foundation
        \fi
    \end{flushleft}
    \vspace{-3mm}
  \endgroup
}%


\def\makeentitle{
    \renewcommand{\baselinestretch}{1.09}
    \baselineskip 12pt
    \noindent
    \vspace{5mm}\\
    {%英文标题
        \bfseries\xiaosanhao\@entitle}
    \vspace{5mm}\\
    {%英文作者
        \renewcommand{\baselinestretch}{0.9}
        \normalsize
        \begin{tabular}[t]{@{}l@{}}\@enauthor\end{tabular}}
    \vspace{5mm}\\
    {%英文单位
        \renewcommand{\baselinestretch}{1.09}
        \bahao\@enaddress\\
        %email
        \ifx \@onlyoneauthor \@empty
            E-mail:~\@authoremaillist
        \else
            *E-mail:~\@authoremaillist
        \fi
        %其他信息
        \ifx \@encomment \@empty
        \else
            \\ \@encomment
        \fi}
    \vspace{5mm}\\
    {%英文摘要关键词
        \bahao\noindent
        \textbf{Abstract}\quad\@enabstract
        \vspace{5mm}\\
        \bahao\noindent
        \textbf{Keywords}\quad\@enkeywords}\\%
}%

\let\@authorcount\@empty
\newcommand*{\authorcv}[3][]{
    \def\@authorphoto{#1}
    \ifx\@authorcount\@empty
        \noindent
        \begin{tabular*}{\textwidth}{l}
            \hspace*{-1em}
            \begin{minipage}[t]{0.48\textwidth}
                \renewcommand{\baselinestretch}{1}
                \baselineskip 9pt
                \parindent=9pt
                \ifx\@authorphoto\@empty
                \else \parpic{\includegraphics[width=25mm]{#1}}
                \fi
                {\noindent\qihao{\bf #2}~#3\par}
            \end{minipage}
        \def\@authorcount{1}
    \else
            \begin{minipage}[t]{0.48\textwidth}
                \renewcommand{\baselinestretch}{1}
                \baselineskip 9pt
                \parindent=9pt
                \ifx\@authorphoto\@empty
                \else \parpic{\includegraphics[width=25mm]{#1}}
                \fi
                {\noindent\qihao{\bf #2}~#3\par}
            \end{minipage}
        \end{tabular*}
        \let\@authorcount\@empty
    \fi
}%

%----------------------- Running heads ---------------------------------
\def\ps@myheadings{
    
    \def\@evenhead{\hspace{-2mm}
        \vbox{\hbox to \textwidth{\rmfamily\small\songti\zihao{-5}
        \hfill}\vspace{1.5truemm}
        }}
    \def\@evenfoot{
        \vbox{\hbox to\textwidth{\footnotesize\rm\hbox to 1cm {\songti\rm\zihao{-5}\small
        \thepage
        \hfill} \hfill \hfill}}}
    
    \def\@oddhead{
        \vbox{\hbox to\textwidth{\rmfamily\small\songti\zihao{-5} \hfill
        }\vspace{1.5truemm}
        }}
    \def\@oddfoot{\vbox{\hbox to \textwidth{\hfill\hbox to 1cm{\hfill\songti\rm\zihao{-5}\small\hspace{2mm}
        \thepage
        }}}}
    \thispagestyle{fancy}\fancyfoot{}
}
\pagestyle{myheadings}



%-------------------------- Abstract ----------------------------------
\renewcommand\abstract[1]{
    \textcolor[rgb]{0.4,0.4,0.4}
    {\begin{picture}(0,0){\put(-22,0){\line(1,0){456}}}\end{picture}}
    \vskip2.3mm\noindent\hspace*{-2.8mm}
    \begin{tabular}{p{0.98\textwidth}!{\color[gray]{0.4}}}
        \zhaiyao
        {\heiti 摘要\quad\,\,}\ignorespaces\fangsong#1
    \end{tabular}
}

\newcommand*\keywords[1]{
    \vskip2.3mm\noindent\hspace*{-3mm}
    \begin{tabular}{p{0.98\textwidth}!{\color[gray]{0.4}}}
        \zhaiyao
        {\heiti 关键词\quad\,\,}\ignorespaces\fangsong#1
    \end{tabular}
    \par \vspace*{-1.25mm}\noindent
    \textcolor[rgb]{0.4,0.4,0.4}
    {\begin{picture}(0,0){\put(0,-5){\line(1,0){456}}}\end{picture}}
}

\newcommand*\Acknowledgements[1]{%
    \vskip 5mm
    \baselineskip 16pt
    {\textbf{致谢}\quad{\fangsong#1}}\par
}

\newcommand*\Supplements[1]{%
    \vskip 5mm
    \baselineskip 16pt
    {\textbf{补充材料}\quad{\fangsong#1~本文的补充材料见网络版info.scichina.com. 
    补充材料为作者提供的原始数据, 作者对其学术质量和内容负责.}}\par
}

%-------------------------- Sections ----------------------------------

\renewcommand\section{
    \@startsection{section}{1}{\z@}%
    {-4.5ex \@plus -1ex \@minus -.2ex}%
    {2.5ex \@plus.1ex}%
    {\normalfont\large\bfseries\heiti\zihao{-4}}
}

\renewcommand\subsection{
    \@startsection{subsection}{2}{\z@}%
    {-2ex\@plus -2ex \@minus -.1ex}%
    {2ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries\heiti}
}

\renewcommand\subsubsection{
    \@startsection{subsubsection}{3}{\z@}%
    {-3ex\@plus -1ex \@minus -.1ex}%
    {1ex \@plus .1ex}%
    {\normalfont\normalsize\bfseries\heiti}
}

\let\oldappendix\appendix
\renewenvironment{appendix}{
    \oldappendix
    \setcounter{section}{0}
    \def\thesection{\Alph{section}}
    \renewcommand{\theequation}{\Alph{section}\arabic{equation}}
    \renewcommand{\thefigure}{\Alph{section}\arabic{figure}}
    \renewcommand{\thetable}{\Alph{section}\arabic{table}}
    \renewcommand{\thealgorithm}{\Alph{section}\arabic{algorithm}}
    \renewcommand{\section}{
        \setcounter{equation}{0}
        \setcounter{table}{0}
        \setcounter{figure}{0}
        \setcounter{algorithm}{0}
        \@startsection{section}{1}{\z@}%
        {-2ex\@plus -2ex \@minus -.1ex}%
        {2ex \@plus .2ex}%
        {\normalfont\normalsize\bfseries}
    }
    \footnotesize
}

\newenvironment{supplement}{
    \newpage
    \oldappendix
    \setcounter{page}{1}
    \setcounter{section}{0}
    \setcounter{equation}{0}
    \setcounter{table}{0}
    \setcounter{figure}{0}
    \setcounter{algorithm}{0}
    \def\sectionname{补充材料(\thesection)}
    \def\thesection{\Roman{section}}
    \renewcommand{\theequation}{S\arabic{equation}}
    \renewcommand{\thefigure}{S\arabic{figure}}
    \renewcommand{\thetable}{S\arabic{table}}
    \renewcommand{\thealgorithm}{S\arabic{algorithm}}
    \renewcommand{\section}{
        \@startsection{section}{1}{\z@}%
        {-2ex\@plus -2ex \@minus -.1ex}%
        {2ex \@plus .2ex}%
        {\normalfont\normalsize\bfseries}
    }
    \footnotesize
}%

%-------------------------- Bibliography ------------------------------
\def\@biblabel#1{#1~}

\renewenvironment{thebibliography}[1]{
    \vspace{6mm}\noindent
    \parbox[c]{20mm}{\heiti\zihao{5}参考文献}
    \hspace{-6mm}
    \rule[0.01\baselineskip]{0.9\textwidth}{0.5pt}
    \vskip0.1in \baselineskip 11.5pt \vspace{-4mm}
    \list{\@biblabel{\@arabic\c@enumiv}}{
        \settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
    }
    \itemsep 0ex \parskip 0ex
    \footnotesize\sloppy
}

\usepackage{cite}
\newcommand{\upcite}[1]{\hspace*{-4pt}\textsuperscript{\cite{#1}}}
\let\citedash\relax\makeatletter
\providecommand{\citedash}{\hbox{$\sim$}\penalty\@m}\makeatother

%------------------ Figures, tables, algorithms -----------------------

\setlength{\floatsep}{16pt plus 1pt minus 1pt}%页面顶部/底部的浮动对象间的垂直距离, 缺省为12pt plus 2pt minus 2pt
\setlength{\textfloatsep}{16pt plus 1pt minus 1pt}%页顶部/底部的浮动对象与文本间垂直距离, 缺省20pt plus 2pt minus 4pt
\setlength{\intextsep}{12pt plus 3pt minus 2pt}%页中浮动对象与上下方文本间垂直距离, 缺省12pt plus 2pt minus 2pt
\setlength{\belowrulesep}{0pt}%横线和其下文字的间距
\setlength{\aboverulesep}{0pt}%横线和其上文字的间距
\setlength{\doublerulesep}{0.4pt}
\newcommand\Times{\fontfamily{ptm}\selectfont}
\newcommand{\picsize}{\fontsize{8pt}{0.4\baselineskip}\selectfont}
\usepackage[bf,footnotesize,labelsep=quad]{caption}
\captionsetup[subfloat]{labelformat=simple,captionskip=0pt}
\captionsetup[table]{aboveskip=1mm}
\captionsetup[figure]{aboveskip=3mm}
\captionsetup[algorithm]{font=footnotesize}
\floatname{algorithm}{算法}

\newcommand*{\cnfigurename}{图}
\newcommand*{\enfigurename}{Figure}
\newcommand*{\cnenfigcaption}[2]{%
    \def\figurename{\cnfigurename}
    \caption{\baselineskip 10pt\bahao\bf #1}
    \addtocounter{figure}{-1}
    \vspace*{-3mm}
    \def\figurename{\enfigurename}
    \caption{\baselineskip 10pt #2}
}

\newcommand*{\cntablename}{表}
\newcommand*{\entablename}{Table}
\newcommand*{\cnentablecaption}[2]{%
    \def\tablename{\cntablename}
    \caption{\baselineskip 10pt\bahao\bf #1}
    \addtocounter{table}{-1}
    \vspace*{-1mm}
    \def\tablename{\entablename}
    \caption{\baselineskip 10pt #2}
}


%------------------------------ Math ----------------------------------
\def\leq{\leqslant}
\def\geq{\geqslant}
\def\le{\leqslant}
\def\ge{\geqslant}
\abovedisplayskip=11pt plus 0pt minus 6pt 
\belowdisplayskip=11pt plus 0pt minus 6pt 
\newcommand{\set}[1]{\ensuremath{\left\{ #1 \right\}}}%
\newcommand{\Set}[2]{\ensuremath{\left\{ #1 \left| \right. #2 \right\}}}%
\newcommand{\abs}[1]{\ensuremath{\left| #1 \right|}}%
\newcommand{\map}[3]{\ensuremath{#1 : #2 \rightarrow #3}}%
\newcommand{\C}[1]{\ensuremath{\mathcal{#1}}}%
\newcommand{\restrict}[2]{\ensuremath{#1 \left|_{#2}\right.}}%
\newcommand{\NN}{\mathbb{N}^0}
\newcommand{\PN}{\mathbb{N}}
\newcommand{\syn}{\mathbf{S}}
\newcommand{\Syn}{\mathbf{M}}
\allowdisplaybreaks
\setlength{\arraycolsep}{2.0pt}

%----------------------------- Theorems -------------------------------
\def\proof{{\heiti 证明}\quad}
\def\th#1{{\bf\heiti\zihao{5} #1}\quad} %通用形式
\renewcommand{\qedsymbol}{} %去掉小方框
\newtheoremstyle{newdefinition}%
    {2pt}% Space above
    {2pt}% Space below
    {\normalfont}% Body font
    {2em}% Indent amount
    {\bfseries}% Theorem head font
    {}% Punctuation after theorem head
    {10pt plus 1pt minus 1pt}% Space after theorem head
    {}% Theorem head spec (can be left empty, meaning `normal')
\theoremstyle{newdefinition}%
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}

\iffalse
\makeatletter
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 9\p@ \@plus4\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip  \abovedisplayskip
   \let\@listi\@listI}
\makeatother
\fi

%--------------------------------- list ---------------------------------
\renewenvironment{itemize}{
\begin{list}{$\bullet$}{
\labelwidth=4em
\labelsep=0.5em
\leftmargin=0em
\rightmargin=0em
\parsep=\parskip
\itemsep=0em
\topsep=0em
\itemindent=2.1em
}
}{\end{list}}

\endinput
