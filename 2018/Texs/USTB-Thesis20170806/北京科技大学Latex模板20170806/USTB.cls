%%
%% This is file `CAS.cls',

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CAS}
              [2012/03/22 v1.0b
 Standard LaTeX document class]

\RequirePackage[utf8]{inputenc}
\synctex=-1%表示不使用，-1表示使用 synctex 文件，1表示使用压缩的 synctex 文件，Windows版本的 TeXWorks 尚未支持压缩的 synctex 文件。启用了 synctex 后，在 TeXWorks 的编辑窗口和浏览窗口按住 Ctrl 键用鼠标单击，即可在 tex 源码和 pdf 内容之间跳转（即正向和反向搜索）。（非常方便，左右对照的看文件）
%% 解决amssymb.sty和xunicode.sty的兼容性问题
\RequirePackage{savesym}
\def\CTEX@save@symlist{hbar,Finv,aleph,beth,gimel,daleth,Game}
\@for \reversed@a:=\CTEX@save@symlist \do{%
	\savesymbol{\reversed@a}}
%% 设置中文字体
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}
\RequirePackage{CJKfntef}
%% 解决amssymb.sty和xunicode.sty的兼容性问题
\@for \reversed@a:=\CTEX@save@symlist \do{%
	\restoresymbol{UTF}{\reversed@a}%
	\expandafter\ifx \csname\reversed@a\endcsname \relax
	\expandafter\let \csname\reversed@a\endcsname \CTEX@undefined
	\fi}
\let\CTEX@save@symlist\CTEX@undefined


\setmainfont[Mapping=tex-text]{Times New Roman}	% 设置英文字体

\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}	% 设置中文字体
\setCJKsansfont{KaiTi}	% 中文斜体
\setCJKmonofont{FangSong}
\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋

\RequirePackage{textcomp}
\RequirePackage{amssymb}
\RequirePackage{makeidx}
\RequirePackage{ulem}
\RequirePackage{nomencl}
\RequirePackage{textcomp}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{bm}%使用命令\bm加粗希腊字母
\RequirePackage[Symbol]{upgreek}
\RequirePackage{url}
\RequirePackage{rotating}
\RequirePackage{supertabular}
\RequirePackage{booktabs}%booktabs为三线表宏包
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{graphicx}
\RequirePackage{threeparttable}
\RequirePackage{epstopdf}
\RequirePackage{setspace}%spacing环境的使用
%\RequirePackage{longtable}

\@ifundefined{showcaptionsetup}{}{%
	\PassOptionsToPackage{caption=false}{subfig}}%定义之后可以使用的命令\subfloat标题子图。

%去掉空白页的页眉页脚
\renewcommand\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
% 定义文档类选项CJKchapter
\newif\if@CJKchapter
\if@compatibility
\@CJKchaptertrue
\else
\DeclareOption{CJKchapter}{\@CJKchaptertrue}
\fi
%% 定义文档类选项noabcount，去掉摘要后边的那个图表和参考文献统计。
\newif\if@noabcount
\if@compatibility
\@noabcounttrue
\else
\DeclareOption{noabcount}{\@noabcounttrue}
\fi
% 定义文档类选项abGB。清华老师的习惯，摘要没有论文题目，题目位置显示“摘要”或“Abstract”
\newif\if@abGB
\if@compatibility
\@abGBtrue
\else
\DeclareOption{abGB}{\@abGBtrue}
\fi
% 定义文档类选项nochaphead。所有页面都有页眉、页码。
\newif\if@nochaphead
\if@compatibility
\@nochapheadtrue
\else
\DeclareOption{nochaphead}{\@nochapheadtrue}
\fi

\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{leqno}{\input{leqno.clo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{a4paper,twoside,onecolumn,final,openright}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\input{bk1\@ptsize.clo}
%%	\tiny			小六号
%%	\scriptsize		六号字
%%	\footnotesize  	小五号
%%	\small			五号字
%%	\normalsize		小四号
%%	\large			四号字
%%	\Large			小三号
%%	\LARGE			三号字
%%	\huge			小二号
%%	\Huge			二号字
%%	\HUGE			小一号
%%	\HUGER			一号字
%%	\HUGEST			小初号
%%	\zero			初号字
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\normalsize{%
   \@setfontsize\normalsize{12.05pt}{14.46}% 小四14.46
   \abovedisplayskip 12\p@ \@plus 3\p@ \@minus 7\p@
   \abovedisplayshortskip \z@ \@plus 3\p@
   \belowdisplayshortskip 6.5\p@ \@plus 3.5\p@ \@minus 3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small{10.54pt}{12.65}%%五号字 10.5bp
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize{9.03}{10.84}%小五号    9bp
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize{7.53}{9.03}}%六号字  7.5bp
\newcommand\tiny{\@setfontsize\tiny{6.52}{7.83}}%小六号		6.5bp
\newcommand\large{\@setfontsize\large{14.05}{16.86}}%四号字   14bp
\newcommand\Large{\@setfontsize\Large{15.06}{18.07}}%小三号   15bp
\newcommand\LARGE{\@setfontsize\LARGE{16.06}{19.27}}%三号字   16bp
\newcommand\huge{\@setfontsize\huge{18.07}{21.68}}%小二号   18bp
\newcommand\Huge{\@setfontsize\Huge{22.08}{26.50}}%二号字   22bp
\newcommand\HUGE{\@setfontsize\HUGE{24.09}{28.91}}%小一号   24bp
\newcommand\HUGER{\@setfontsize\HUGER{26.10}{31.32}}%一号字   26bp
\newcommand\HUGEST{\@setfontsize\HUGEST{36.14}{43.36}}%小初号   36bp
\newcommand\zero{\@setfontsize\zero{42.16}{50.59}}%初号字   42bp
%% 用中文习惯定义字号
\newcommand\xliu{\tiny}			%小六号字
\newcommand\liu{\scriptsize}	%六号字
\newcommand\xwu{\footnotesize}	%小五号字
\newcommand\wu{\small}			%五号字
\newcommand\xsi{\normalsize}	%小四号字
\newcommand\si{\large}			%四号字
\newcommand\xsan{\Large}		%小三号字
\newcommand\san{\LARGE}			%三号字
\newcommand\xer{\huge}			%小二号字
\newcommand\er{\Huge}			%二号字
\newcommand\xyi{\HUGE}			%小一号字
\newcommand\yi{\HUGER}			%一号字
\newcommand\xchu{\HUGEST}		%小初号字
\newcommand\chu{\zero}			%初号字
%% 页面尺寸设置
\RequirePackage[bindingoffset=1cm,inner=3cm,outer=3cm,top=2.55cm,headsep=1cm,includefoot,footskip=1cm,bottom=2.2cm]{geometry}

%% 出现在页面的顶部或底部的浮动对象之间的垂直距离。 缺省为\setlength\floatsep {12\p@ \@plus 2\p@ \@minus 4\p@}。 
\setlength\floatsep {20pt plus 5pt minus 2pt}
%% 出现在页面的顶部或底部的浮动对象与文本之间的垂直距离。 缺省为\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength{\textfloatsep} {19pt plus 2pt minus 2pt}
%% 出现在页面中间的浮动对象与上下方文本之间的垂直距离。 缺省为\setlength\intextsep {14\p@ \@plus 4\p@ \@minus 4\p@}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
%% 是在双列输出时用 \textfloatsep 的数值{14\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\dblfloatsep    {10\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\dbltextfloatsep{10\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{10\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{10\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
%\setlength\partopsep{130\p@ \@plus 2\p@ \@minus 2\p@}
\def\@listi{\leftmargin 3em		%%\leftmargini
            \itemindent 0em
            \parsep 0\p@  \@plus 1\p@ \@minus 0\p@
            \topsep 0\p@ \@plus 1\p@   \@minus 0\p@
            \itemsep 0\p@  \@plus 1\p@ \@minus 0\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@   \@plus2.5\p@ \@minus\p@
              \parsep    0\p@ \@plus\p@    \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@\@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\setlength\lineskip{50pt plus 2pt minus 2pt}
%\setlength\baselineskip {500pt}
%\setlength\normallineskip{10\p@}

\setlength{\parindent}{2em}%设置首行缩进2字符
\renewcommand\baselinestretch{1.383}%% 行间距
%% 段间距
\parskip 0.1\baselineskip %plus 0.05ex minus 0.05ex
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{0.85}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.65}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{0.15}
\renewcommand\floatpagefraction{0.6}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}

\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}%设置标题的等级深度为2
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
%% 定义中文章编号，如“第一章”中的“一”。
\newcommand\CJKthechapter {\CJKnumber{\@arabic\c@chapter}}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}}
\newcommand\mainmatter{%
    \cleardoublepage%
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse}
\newcommand\part{
  \cleardoublepage
  \thispagestyle{plain}
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}

%% 定义计数器totalfig、totaltab，在每一章开头将上一章的图表数累加，得到图表总数。
\newcounter{totalfig}
\newcounter{totaltab}
\newcounter{totalpage}
\newcommand\chapter{\clearpage
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
                    
                    
%% 此处按中文习惯修改章号:中文数字表示章号

\def\@chapter[#1]#2{
	\addtocounter{totalfig}{\c@figure}
	\addtocounter{totaltab}{\c@table}
	\addtocounter{totalpage}{\c@page}
		\addtocontents{toc}{\protect\addvspace{3\p@}}%不同章节中添加距离
	\ifnum \c@secnumdepth >\m@ne

	\if@mainmatter
		\refstepcounter{chapter}
		\typeout{\@chapapp\space\thechapter.}
		\if@CJKchapter
			\addcontentsline{toc}{chapter}{第{\CJKthechapter}章\quad #1}
%           {\protect\numberline{第{\CJKthechapter}章}\quad #1}
		\else
			\addcontentsline{toc}{chapter}{\thechapter\quad #1}
		\fi
	\else
		\refstepcounter{chapter}%
 %                        \typeout{\@chapapp\space\thechapter.}%
		\addcontentsline{toc}{chapter}{附录\quad\thechapter}
	\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
%% 下边两句在图表目录中不同章之间加额外的间距
%    \addtocontents{lof}{\protect\addvspace{6\p@}}%
%    \addtocontents{lot}{\protect\addvspace{6\p@}}%
	\@makechapterhead{#2}%
	\@afterheading
}
\def\@makechapterhead#1{
  \vspace*{-15\p@}%设置正文黑体加粗标题上距
  {\ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
%% 对CJKchapter选项设置章标题居中
\if@CJKchapter
\parindent \z@ \centering
\bf\heiti\xsan 第\CJKthechapter 章\quad #1
\else
\parindent \z@ \raggedright
\bf\heiti\xsan \thechapter\quad #1
\fi
\else
\parindent \z@ \centering\bf\heiti\xsan 附\quad 录\quad\thechapter\\
#1
\fi
\fi
\vskip 18\p@
}}
\def\@schapter#1{
	%\addtocontents{toc}{\protect\addvspace{6\p@}}%设置非正式标题的行间距
	%\addcontentsline{toc}{chapter}{#1}%
	\@makeschapterhead{#1}%
	\@afterheading
}
%% 定义\chapter*的标题样式
\def\@makeschapterhead#1{%
  \vspace*{-6\p@}%设置非加粗标题上距
  {
  	\centering
    \bfseries\heiti
    \interlinepenalty\@M
     \xsan #1\par\nobreak
     \@mkboth{\MakeUppercase #1}{\MakeUppercase #1}
    \vskip 30\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-13pt \@plus -3pt \@minus -2pt}%
                                   {13pt \@plus 2pt}%
                                   {\normalfont\si\bfseries\heiti}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-13pt\@plus -2pt \@minus -1pt}%
                                     {13pt \@plus 1pt}%
                                     {\normalfont\normalsize\bfseries\heiti}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-5pt\@plus -2pt \@minus -1pt}%
                                     {3pt \@plus 1pt}%
                                     {\normalfont\normalsize\heiti}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {0ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\heiti}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\heiti}}
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendixname{附录}
\usepackage{titlesec}
\newcommand\appendix{\par
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \gdef\@chapapp{\appendixname}
  \gdef\thechapter{\@Alph\c@chapter}
%\titleformat{\chapter}[display]{\filcenter\heiti\si}{附\quad 录\quad\thechapter}{0em}{}
%\titlespacing{\chapter}{0pt}{-10pt}{15pt}
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
%% 公式、图表按章编号，中间以“-”间隔。
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter -\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \ \thechapter -\fi \@arabic\c@figure\ }

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \ \thechapter -\fi \@arabic\c@table\ }
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
%\newlength\abovecaptionskip
%\newlength\belowcaptionskip
%\setlength\abovecaptionskip{0pt}
%\setlength\belowcaptionskip{0pt}


%% 设置图形与正文的间距，标题与图形的间距，子图引用加小括号。
\RequirePackage[font=small,labelsep=space]{caption}
\RequirePackage[labelformat=simple]{subfig}
%\captionsetup[subfloat]{captionskip=0pt,nearskip=0pt,farskip=0pt}
%\captionsetup[float]{position=bottom,captionskip=20pt,belowskip=0pt,aboveskip=0pt}
\captionsetup[subtable]{captionskip=0pt,nearskip=0pt,farskip=0pt}
\captionsetup[subfigure]{captionskip=0pt,nearskip=0pt,farskip=0pt}
\captionsetup[figure]{format=hang,font={bf,heiti,small},position=bottom,belowskip=0pt,aboveskip=20pt}
\captionsetup[table]{font={bf,heiti,small},belowskip=10pt,aboveskip=12pt}
\renewcommand{\thesubfigure}{(\alph{subfigure})~}
\renewcommand{\thesubtable}{(\alph{subtable})~} 



\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
%% 目录中的点之间的间距
\newcommand\@dotsep{1}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \chapter*{\contentsname
        \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
%% 目录点换用中文cdot
\def\@dottedtocline#1#2#3#4#5{%
 \ifnum #1>\c@tocdepth \else
   \vskip \z@ \@plus.2\p@
   {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {#4}\nobreak
    \leaders\hbox{$\m@th
       \mkern \@dotsep mu \cdot \mkern \@dotsep
       mu$}\hfill
    \nobreak
    \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
    \par}%
 \fi}
%% 定义目录各标题的缩进
\newcommand*\l@chapter{\@dottedtocline{0}{0em}{2em}}
\newcommand*\l@section{\@dottedtocline{1}{2em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{4.3em}{3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.3em}{4em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\newcommand\listoffigures{%
	    \chapter*{\listfigurename}%
          \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \renewcommand{\numberline}[1]{图~##1~}
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\newcommand\listoftables{%
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \renewcommand{\numberline}[1]{表~##1~}
    \@starttoc{lot}%
    }

\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]{ 
     \chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%   
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m
      }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

%%行内引用参考文献（非上标形式）
\DeclareRobustCommand\lcite{\@lcite}   
\def\@lcite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}   


\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \cleardoublepage
                \phantomsection
                	\addtocontents{toc}{\protect\addvspace{6\p@}}
				\addcontentsline{toc}{chapter}{\indexname}
%                \twocolumn[\@makeschapterhead{\indexname}]%
				\@makeschapterhead{\indexname}
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{目\quad 录}
\newcommand\listfigurename{插图目录}
\newcommand\listtablename{表格目录}
\newcommand\bibname{参考文献}
\newcommand\indexname{索\quad 引}
\newcommand\figurename{图}
\newcommand\tablename{表}
\newcommand\partname{}
\newcommand\chaptername{}
\usepackage{nomencl}
\def\nomname{术语表}
%\newcommand\appendixname{附\quad 录}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%% 使用参考文献包：数字、排序&压缩、上标、方括号
\usepackage[numbers,sort&compress,super,square]{natbib}
\renewcommand{\bibfont}{\small}	% 设置参考文献字体大小，small相当于五号字。
\setlength\bibsep{0pt}	% 设置参考文献各项间的距离
\renewcommand{\bibpreamble}{\renewcommand\baselinestretch{1.59}}	% 设置参考文献的行间距
%% 此处引入graphicx包，否则文档类中没有图形处理的包。当文档中没有图形时，LyX不会自动引用graphicx包，输出封面时1.png无法载入。
\usepackage{graphicx}
%% 声明封面变量
\def\@confidential{}
\def\@thesistype{}
\def\@subtitle{}
\def\@tutor{}
\def\@tutorinstitute{}
\def\@degree{}
\def\@edegree{}
\def\@institute{}
\def\@major{}
\def\@etitle{}
\def\@esubtitle{}
\def\@etutor{}
\def\@eauthor{}
\def\@einstitute{}
\def\@emajor{}
\def\@emajortype{}
\def\@edate{}
\def\@UDC{}
\def\@institutecode{}
\def\@secondlevelunit{}
\def\@esecondlevelunit{}
\def\@professionaltitle{}
\def\@classificationnumber{}
\def\@degreeawardingtime{}
\def\@researcharea{}
\def\@keywords{}
\def\@studentID{}
\newcommand\confidential[1]{\def\@confidential{#1}}
\newcommand\thesistype[1]{\def\@thesistype{#1}}
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\tutor[1]{\def\@tutor{#1}}
\newcommand\tutorinstitute[1]{\def\@tutorinstitute{#1}}
\newcommand\degree[1]{\def\@degree{#1}}
\newcommand\edegree[1]{\def\@edegree{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\institute[1]{\def\@institute{#1}}
\newcommand\etitle[1]{\def\@etitle{#1}}
\newcommand\esubtitle[1]{\def\@esubtitle{#1}}
\newcommand\etutor[1]{\def\@etutor{#1}}
\newcommand\eauthor[1]{\def\@eauthor{#1}}
\newcommand\einstitute[1]{\def\@einstitute{#1}}
\newcommand\emajor[1]{\def\@emajor{#1}}
\newcommand\emajortype[1]{\def\@emajortype{#1}}
\newcommand\edate[1]{\def\@edate{#1}}
\newcommand\UDC[1]{\def\@UDC{#1}}
\newcommand\institutecode[1]{\def\@institutecode{#1}}
\newcommand\secondlevelunit[1]{\def\@secondlevelunit{#1}}
\newcommand\esecondlevelunit[1]{\def\@esecondlevelunit{#1}}
\newcommand\professionaltitle[1]{\def\@professionaltitle{#1}}
\newcommand\classificationnumber[1]{\def\@classificationnumber{#1}}
\newcommand\degreeawardingtime[1]{\def\@degreeawardingtime{#1}}
\newcommand\researcharea[1]{\def\@researcharea{#1}}
\newcommand\studentID[1]{\def\@studentID{#1}}
%% 封面设置
\newcommand\maketitle{% 定义maketitle命令
	%% 英文封面设置
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		\vspace*{20pt}
		\renewcommand\baselinestretch{1.75}
		\xer\@title
		\vskip \stretch{1.3}
		\xer\@etitle
		
		\vspace*{8pt}
		\@esubtitle
		\vskip \stretch{1.5}
		\xsi 
		研究生姓名：\@author\\
		指导教师姓名：\@tutor\\
		北京科技大学\@secondlevelunit\\
		北京 100083，中国
		\vskip \stretch{1.2}
		\xsi
		Doctor Degree Candidate: \@eauthor \\
		Supervisor: \@etutor\\
		\@esecondlevelunit \\
		University of Science and Technology Beijing \\
		30 Xueyuan Road, Haidian District\\
		Beijing 100083, P.R. CHINA
		\vskip \stretch{1}
		\vskip 20pt
		
	\end{center}
	%\renewcommand\baselinestretch{1.383}
%	\clearpage
	%  \if@twoside
	%\hbox{}\thispagestyle{empty}
%	\newpage
%	\hbox{}\thispagestyle{empty}
	%    \cleardoublepage
	%  \fi
	%中文封面设置
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
	\vspace*{-0.2cm}
		
	{\xsi \qquad \hbox to 1.2cm{分\hfill 类\hfill 号}：\underline{\hbox to 2.5cm{\hfill\wu\@classificationnumber\hfill}}} \hfill{}  {\xsi 密\qquad 级：\underline{\hbox to 2.5cm{\hfill\wu\@confidential\hfill}}\qquad\hfill} \\\vspace{15pt}
	{\xsi \qquad \hbox to 1.2cm{U\hfill D\hfill C}：\underline{\hbox to 2.5cm{\hfill\wu\@UDC\hfill}}} \hfill{}  {\xsi 单位代码：\underline{\hbox to 2.5cm{\hfill\wu\@institutecode\hfill}}\qquad\hfill} \\
	\vskip \stretch{1.3}
	{\bfseries\heiti\xer 北京科技大学博士学位论文}
	
	
	\vskip \stretch{1.2}
	{{\bf\heiti\si 论文题目：}\underline{\hbox to 10.5cm{\songti\si\hfill\@title\hfill}}}
	
	\vspace*{8pt}
	%{\hspace{2cm}\bf\songti\san\CJKunderline\@subtitle}
	
	\vspace*{40pt}
	{{\bf\heiti\si 作者：}\underline{\hbox to 6cm{\songti\si\hfill\@author\hfill}}}
	\vskip \stretch{4.5}
	
	\si\songti
	\def\tabcolsep{1pt}
	\def\arraystretch{1.33}
	\begin{tabular}{cccc}
		{\bf\heiti\si 指\hfill 导\hfill 教\hfill 师：}&\underline{\hbox to 4.6cm{\wu\hfill\@tutor\quad\@professionaltitle\hfill}} &{\bf\heiti 单位：}&\underline{\hbox to 4.2cm{\wu\hfill\@institute\hfill}}\\
		{\bf\heiti 指导小组成员：}&\underline{\hbox to 4.6cm{}} &{\bf\heiti 单位：}&\underline{\hbox to 4.2cm{}}\\
		&\underline{\hbox to 4.6cm{}} &{\bf\heiti 单位：}&\underline{\hbox to 4.2cm{}}\\
		{\bf\heiti 论文提交日期：}&\multicolumn{1}{l}{{\si\@date}}&&\\
		{\bf\heiti 学位授予单位：}&\multicolumn{1}{l}{\si\bf\heiti 北{ }京{ }科{ }技{ }大{ }学}&&\\
	\end{tabular} 
	\vskip \stretch{0.5}
	%\@date
\end{center}
%	\clearpage
 %   \newpage
  %  \hbox{}\thispagestyle{empty}


}
%% 定义各种环境noabcount
% 致谢环境
\newenvironment{acknowledgements}
{\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{3\p@}}
	\addcontentsline{toc}{chapter}{致\quad 谢}
	%\@mkboth{\MakeUppercase 致\quad 谢}{\MakeUppercase 致\quad 谢}%
	%\thispagestyle{plain}
	\begin{center}
		\vspace*{0pt}
		{ \bf\heiti\xsan 致\quad 谢}
	\end{center}
	\vspace{30pt}
	\hspace{1.75em}}%hspace{1.75em}首行缩进2个字符

% 中文摘要
\newenvironment{abstract}
  {\cleardoublepage
\phantomsection
\addtocontents{toc}{\protect\addvspace{3\p@}}
\addcontentsline{toc}{chapter}{摘\quad 要}
\@mkboth{\MakeUppercase 摘\quad 要}{\MakeUppercase 摘\quad 要}%
\thispagestyle{plain}
\begin{center}
\vspace*{0pt}
{ \if@abGB\bf\heiti\xsan\@title\else\bf\heiti\xsan 摘\quad 要 \fi}
\end{center}
\vspace{30pt}\if@abGB{\heiti 摘要}：\else\xsi\hspace{1.75em}\fi}
%去掉统计{\if@noabcount\else 图~\ref{totalfig}~幅，表~\ref{totaltab}~个，参考文献~\ref{totalbib}~篇。\fi}

% 英文摘要
\newcommand\eabstract[1]{
	\cleardoublepage
\phantomsection
	\addtocontents{toc}{\protect\addvspace{3\p@}}
\addcontentsline{toc}{chapter}{Abstract}
\@mkboth{\MakeUppercase Abstract}{\MakeUppercase Abstract}%
\thispagestyle{plain}
\begin{center}
\vspace*{-10pt}
{\bf\heiti\xsan\@etitle\\ \vspace{20pt} \if@abGB\@etitle\else\bf\heiti Abstract \fi}
\end{center}
\vspace{25pt}
\if@abGB{\bf Abstract}:\ #1\else\hspace{2em}#1\fi}

\newcommand\keywords[1]{%
  \noindent{\bf\heiti 关键词：#1} 
\def\@keywords{#1}}

\newcommand\ekeywords[1]{%
  \noindent{\bf Keywords:~#1} }

%插图目录环境
\newenvironment{figureslist}
{\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{3\p@}}
	\addcontentsline{toc}{chapter}{插图目录}
    }

%表格目录环境
\newenvironment{tableslist}
{\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{3\p@}}
	\addcontentsline{toc}{chapter}{表格目录}
}

%参考文献环境
\newenvironment{biblio}
{\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{3\p@}}
	\addcontentsline{toc}{chapter}{参考文献}
}

%作者简历及在在学期间发表的学术论文与研究成果环境
\newenvironment{resume}
{\cleardoublepage
	\phantomsection
	\addtocontents{toc}{\protect\addvspace{4\p@}}
	\addcontentsline{toc}{chapter}{作者简历及在学研究成果}
	%\@mkboth{\MakeUppercase 致\quad 谢}{\MakeUppercase 致\quad 谢}%
	%\thispagestyle{plain}
	\begin{center}
		\vspace*{-0.5cm}
		{\bf\heiti\xsan 作者简历及在学研究成果}
	\end{center}
	\vspace{1.35cm}}%hspace{1.75em}首行缩进2个字符



%% 学位论文使用权说明
%\RequirePackage{dashrule}%画虚线宏包
\newcommand\Declaration[1]{
{%\titleformat{\chapter}[hang]{\filcenter\bf\fangsong\Large}{}{1em}{}
\cleardoublepage
\phantomsection
%\thispagestyle{empty}
\begin{center}
\vspace*{-10pt}
\bf\heiti\xsan 独创性说明
\addtocontents{toc}{\protect\addvspace{4\p@}}
\addcontentsline{toc}{chapter}{独创性说明}
\end{center}
\vspace{35pt}
\songti\si
\setlength{\parindent}{2em}

本人郑重声明：所呈交的论文是我个人在导师指导下进行的研究工作及取得研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写的研究成果，也不包含为获得北京科技大学或其他教育机构的学位或证书所使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明并表示了谢意。

\vspace{20pt}
\begin{flushright}
	{签名：\underline{\hbox to 2.7cm{}} 日期：\underline{\hbox to 3cm{}}}
\end{flushright}
%\vspace{5pt}
%\noindent\hdashrule[0.5ex]{16.5cm}{1.3pt}{1.3pt 1.3pt}

\vspace{120pt}
\phantomsection
\begin{center}
\bf\heiti\xsan 关于论文使用授权的说明
\addtocontents{toc}{\protect\addvspace{4\p@}}
\addcontentsline{toc}{chapter}{关于论文使用授权的说明}
\end{center}
\vspace{35pt}

本人完全了解\@institute 有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许该论文被查阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。

{\bfseries\heiti(密的论文在解密后应遵守此规定)}

\vspace{30pt}
\noindent 签名：\underline{\hbox to 2.7cm{}}\hfill 导师签名：\underline{\hbox to 2.7cm{}}\hfill 日期：\underline{\hbox to 2.7cm{}}

    %\newpage
    %\hbox{}\thispagestyle{empty}
}
}

\newcommand\dissertationdata[1]{
\cleardoublepage
\phantomsection
\begin{center}
	\vspace*{-10pt}
	\bf\heiti\xsan 学位论文数据集
	\addtocontents{toc}{\protect\addvspace{4\p@}}
	\addcontentsline{toc}{chapter}{学位论文数据集}
\end{center}
\vspace{35pt}
\songti\wu	
\begin{table}[h!]
	%\addtolength{\tabcolsep}{-2.7pt}
	\renewcommand\arraystretch{1.3}
	\centering{}%
	\begin{tabularx}{\linewidth}{|p{0.205\linewidth}|p{0.12\linewidth}|p{0.175\linewidth}|p{0.17\linewidth}|p{0.175\linewidth}|}
		 \cline{1-5}
		{\bfseries\heiti 关键词{*}} & {\bfseries\heiti 密级{*}} & {\bfseries\heiti 中图分类号*} & {\bfseries\heiti UDC} & {\bfseries\heiti 论文资助}\\
		 \cline{1-5}
		\@keywords &\@confidential  & \@classificationnumber & \@UDC& \\
		 \cline{1-5}
		\multicolumn{2}{|l|}{\bfseries\heiti 学位授予单位名称{*}} &{\bfseries\heiti 学位授予单位代码{*}} &{\bfseries\heiti 学位类别{*}} &{\bfseries\heiti 学位级别{*}}\\
		 \cline{1-5}
		\multicolumn{2}{|l|}{\@institute} & {\@institutecode} & 工学 &博士\\
		 \cline{1-5}
		\multicolumn{2}{|l|}{\bfseries\heiti 论文题名{*}} & \multicolumn{2}{l|}{\bfseries\heiti 并列题名} &{\bfseries\heiti 论文语种{*}}\\
		 \cline{1-5} 
		\multicolumn{2}{|l|}{\multirow{2}{0.325\linewidth}{\@title}} & \multicolumn{2}{l|}{无} & 中文\\
		\multicolumn{2}{|l|}{}&\multicolumn{2}{l|}{}&\\
		 \cline{1-5}
		{\bfseries\heiti 作者姓名{*}} & \multicolumn{2}{l|}{\@author} &{\bfseries\heiti 学号{*}} &\@studentID \\
		 \cline{1-5} 
		\multicolumn{2}{|l|}{\bfseries\heiti 培养单位名称{*} } & {\bfseries\heiti 培养单位代码{*}} & {\bfseries\heiti 培养单位地址} & {\bfseries\heiti 邮编}\\
		 \cline{1-5} 
		\multicolumn{2}{|l|}{{\@institute}} & {\@institutecode} & {{北京市海淀区学院路30号}} &{ 100083}\\
	    \cline{1-5}
		\multicolumn{2}{|l|}{\bfseries\heiti 学科专业{*}} & {\bfseries\heiti 研究方向{*}} & {\bfseries\heiti 学制{*}} & {\bfseries\heiti 学位授予年{*} }\\
		 \cline{1-5}
		\multicolumn{2}{|l|}{\@major} & {\@researcharea} &{3} &{\@degreeawardingtime}\\
		 \cline{1-5} 
		{\bfseries\heiti 论文提交日期{*}} & \multicolumn{4}{l|}{\@date}\\
		 \cline{1-5} 
		{\bfseries\heiti 导师姓名{*} }& \multicolumn{2}{l|}{\@tutor} & {\bfseries\heiti 职称{*}} & \@professionaltitle \\
		 \cline{1-5} 
		{\bfseries\heiti 评阅人} & \multicolumn{2}{l|}{{\bfseries\heiti 答辩委员会主席{*}}} & \multicolumn{2}{l|}{\bfseries\heiti 答辩委员会成员}\\
		 \cline{1-5} 
		 & \multicolumn{2}{l|}{} & \multicolumn{2}{l|}{}\\
		 & \multicolumn{2}{l|}{} & \multicolumn{2}{l|}{}\\
		 %& \multicolumn{2}{l|}{} & \multicolumn{2}{l|}{}\\
		 \cline{1-5} 
		\multicolumn{5}{|l|}{{\bfseries\heiti 电子版论文提交格式}\hfill 文本(\quad )\quad 图像(\quad )\quad 视频(\quad )\quad 音频(\quad )\quad 多媒}\\
		\multicolumn{5}{|l|}{体(\quad ) 其他(\quad)}\\
		\multicolumn{5}{|l|}{{\bfseries\heiti 推荐格式：}application/msword; application/pdf }\\
		 \cline{1-5} 
		\multicolumn{2}{|l|}{\bfseries\heiti 电子版论文出版(发布)者} & \multicolumn{2}{l|}{\bfseries\heiti 电子版论文出版(发布)地} & {\bfseries\heiti 权限声明}\\
		 \cline{1-5} 
		\multicolumn{2}{|l}{} & \multicolumn{2}{l|}{} & \\
		 \cline{1-5} 
		{\bfseries\heiti 论文总页数{*}} & \multicolumn{4}{l|}{}\\
		 \cline{1-5} 
		\multicolumn{5}{|l|}{共 33 项，其中带{*}为必填数据，为 22 项。}\\
		\cline{1-5} 
	\end{tabularx}
\end{table}
\newpage
\hbox{}
\thispagestyle{empty}
}
%学位论文数据集环境

%% 定义数学包与公式的引用格式。公式编号两边加括号和空格，以便和前后的中文形成美观的间距。不过这种公式的引用不可以出现在段首与标点之前，行文中应避免出现这种情况。否则就应使用\ref{}并手动加英文括号与空格的方式实现公式引用。

\usepackage{amsmath}
%\usepackage{amssymb}
%\usepackage{amsopn}
%\usepackage{amsbsy}


\renewcommand\eqref[1]{\ (\ref{#1})\ }


%% 页眉页角设置
\usepackage{fancyhdr}
\pagestyle{fancy}


%% 定义plain页眉页角样式（只有页码），用于章首页。nochaphead在章首页显示页眉。
\if@nochaphead
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[CE,CO]{\small ~{- }\thepage{ -}~}
}
\else
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[CE]{\small \@title}
  \fancyhead[CO]{\small 北京科技大学博士学位论文}
  \fancyfoot[CE,CO]{\small ~{- }\thepage{ -}~}
}
\fi
%% 定义fancy页眉页角样式（偶数页页眉题目，奇数页页眉章名，页码居中），用于正常页。
\pagestyle{fancy}
  \fancyhf{}
  \fancyhead[CE]{\small \@title}
  \fancyhead[CO]{\small 北京科技大学博士学位论文}
  \fancyfoot[CE,CO]{\small ~{- }\thepage{ -}~}

%% 修改enumerate环境的间距
\RequirePackage{enumitem}
\setenumerate[1]{itemsep=0pt, partopsep=0ex, parsep=0pt, topsep=0pt, leftmargin=*, labelindent=\parindent, listparindent=0pt}

\usepackage{pifont}  
\usepackage[perpage]{footmisc}  %每页脚注重新编号
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}  %使用pifont

%\usepackage{pifont}
%\addtocounter{footnote}{171}
%\renewcommand{\thefootnote}{\ding{\value{footnote}}}

%% 文档最后统计图表总数。
\AtEndDocument{\label{lastpage}
\addtocounter{totaltab}{-1}
\refstepcounter{totaltab}
\label{totaltab}
\addtocounter{totalfig}{-1}
\refstepcounter{totalfig}
\label{totalfig}
%\addtocounter{totalbib}{\c@NAT@ctr}
%\addtocounter{totalbib}{-1}
%\refstepcounter{totalbib}
%\addtocounter{NAT@ctr}{\c@NAT@ctr}
\addtocounter{NAT@ctr}{-1}
\refstepcounter{NAT@ctr}
\label{totalbib}
\addtocounter{totalpage}{-1}
\refstepcounter{totalpage}
\label{totalpage}
\clearpage

}

\endinput

% End of file `book.cls'.
