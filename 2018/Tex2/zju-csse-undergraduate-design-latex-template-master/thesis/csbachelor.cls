%%
%% This is file `csbachelor.cls',
%%
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{csbachelor}
    [2017/03/28 v1.0 ZJU Thesis Proposal Class]

\DeclareOption{authoryear}{\def\zjubibstyle{A}}
\DeclareOption{numberorder}{\def\zjubibstyle{N}}

\newif\ifzju@side\zju@sidetrue
\DeclareOption{twoside}{\zju@sidetrue}
\DeclareOption{oneside}{\zju@sidefalse}

\ExecuteOptions{twoside,oneside}
\ProcessOptions\relax
\ifzju@side
   \LoadClass[a4paper,12pt,twoside,titlepage,openany]{book}
   \def\zjuside{T}
\else
   \LoadClass[a4paper,12pt,oneside,titlepage]{book}
   \def\zjuside{O}
\fi

%\RequirePackage[top=2.0cm,bottom=2.4cm,left=3.4cm,right=2.4cm,includehead,includefoot]{geometry}
\RequirePackage[top=38mm,bottom=38mm,left=32mm,right=32mm,includefoot]{geometry}

\RequirePackage{ifthen}
\RequirePackage{calc}
% 张海
\RequirePackage{xpatch}

\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{amsthm}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

\RequirePackage[normalem]{ulem}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% 张海
%\setmainfont{TeX Gyre Termes}
%\setsansfont{TeX Gyre Heros}
%\setmonofont{TeX Gyre Cursor}

% 张海
%\RequirePackage[CJKtextspaces,CJKmathspaces,slantfont,boldfont]{xeCJK}
\RequirePackage[slantfont,boldfont]{xeCJK}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
%\setCJKmonofont{SimSun}
\setCJKmonofont{SimHei}
%\setCJKmainfont{FZSongS-Extended}
%\setCJKsansfont{FZHei-B01}
%\setCJKmonofont{FZHei-B01}
\punctstyle{kaiming}

\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{nomencl}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{url}
\urlstyle{tt}

\RequirePackage{lscape}
\RequirePackage{graphicx}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{caption2}
\RequirePackage{multirow}
\RequirePackage{dcolumn}
\RequirePackage{colortbl}
\RequirePackage{threeparttable}
\RequirePackage{array}

\setlength{\headheight}{22pt}
\setlength{\footskip}{1.3cm}
\raggedbottom

\frenchspacing
\widowpenalty=10000
\setlength{\parsep}{0em}
\setlength{\parskip}{0em}
\setlength{\parindent}{2em}
\setlength{\itemsep}{0em}

\RequirePackage{enumitem}
\setlist{noitemsep}

\let\oldthebibliography\thebibliography
\let\endoldthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{\begin{oldthebibliography}{#1}\setlength{\itemsep}{0em}\setlength{\parskip}{0em}}{\end{oldthebibliography}}

\renewcommand{\baselinestretch}{1.389} % 20pt / 14.4pt
\def\verbatim@font{\normalfont\ttfamily\linespread{1}\wuhao}
\renewcommand{\arraystretch}{1}

%\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}
%\DeclareRobustCommand{\bahao}{\fontsize{5pt}{\baselineskip}\selectfont}
% 张海
\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{50.4pt}\selectfont}
\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{43.2pt}\selectfont}
\DeclareRobustCommand{\yihao}{\fontsize{26pt}{31.2pt}\selectfont}
\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{28.8pt}\selectfont}
\DeclareRobustCommand{\erhao}{\fontsize{22pt}{26.4pt}\selectfont}
\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{21.6pt}\selectfont}
\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{19.2pt}\selectfont}
\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{18pt}\selectfont}
\DeclareRobustCommand{\sihao}{\fontsize{14pt}{16.8pt}\selectfont}
\DeclareRobustCommand{\shisanbang}{\fontsize{13pt}{15.pt}\selectfont}
\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{14.4pt}\selectfont}
\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{12.6pt}\selectfont}
\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{10.8pt}\selectfont}
\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{7.8pt}\selectfont}
\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{6.6pt}\selectfont}
\DeclareRobustCommand{\bahao}{\fontsize{5pt}{6pt}\selectfont}
% 张海
\setCJKfamilyfont{FangSong}{FangSong}
\setCJKfamilyfont{HeiTi}{SimHei}
%\setCJKfamilyfont{KaiShu}{AR PL KaitiM GB}
\setCJKfamilyfont{KaiShu}{KaiTi}
\setCJKfamilyfont{LiShu}{LiSu}
\setCJKfamilyfont{SongTi}{SimSun}
\setCJKfamilyfont{YouYuan}{YouYuan}
\setCJKfamilyfont{STFangsong}{STFangsong}
\setCJKfamilyfont{STXingkai}{STXingkai}
%\setCJKfamilyfont{FangSong}{FZFangSong-Z02}
%\setCJKfamilyfont{HeiTi}{FZHei-B01}
%\setCJKfamilyfont{KaiShu}{FZKai-Z03}
%\setCJKfamilyfont{LiShu}{FZLiShu-S01}
%\setCJKfamilyfont{SongTi}{FZSongS-Extended}
%\setCJKfamilyfont{YouYuan}{YouYuan}
%\setCJKfamilyfont{STFangsong}{FZFangSong-Z02}
%\setCJKfamilyfont{STXingkai}{FZXingKai-S04}
\newfontfamily{\timesnewroman}{Times New Roman}
\newfontfamily{\arial}{Arial}
\newfontfamily{\couriernew}{Courier New}
\DeclareRobustCommand{\fangsong}{\CJKfamily{FangSong}}
\DeclareRobustCommand{\stfangsong}{\CJKfamily{STFangsong}}
\DeclareRobustCommand{\stxingkai}{\CJKfamily{STXingkai}}
\DeclareRobustCommand{\heiti}{\arial\CJKfamily{HeiTi}}
\DeclareRobustCommand{\kaiti}{\CJKfamily{KaiShu}}
\DeclareRobustCommand{\lishu}{\CJKfamily{LiShu}}
\DeclareRobustCommand{\songti}{\CJKfamily{SongTi}}
\DeclareRobustCommand{\youyuan}{\arial\CJKfamily{YouYuan}}
\setcounter{secnumdepth}{4}

% 张海
\xpatchcmd{\frontmatter}{\pagenumbering{roman}}{\pagenumbering{Roman}}{}{}
\renewcommand*{\thechapter}{第 \arabic{chapter} 章}
\renewcommand*{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand*{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand*{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\RequirePackage{chngcntr}
\xpatchcmd{\c@t@sin}{\@nameuse{the#2}.}{\arabic{#2}-}{}{}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}

\titleformat{\chapter}[block]{\linespread{1}\heiti\sanhao\bfseries\filcenter}{\thechapter}{1em}{}{}
\titlespacing{\chapter}{0em}{0pt}{18pt}
\titlecontents{chapter}[0em]{}{\songti\sihao\thecontentslabel\hspace{1em}}{\songti\sihao}{\songti\sihao\titlerule*[5pt]{.}\contentspage}

\titleformat{\section}[hang]{\linespread{1}\heiti\sihao\bfseries}{\thesection}{1em}{}{}
\titlespacing{\section}{0em}{24pt}{6pt}
\titlecontents{section}[2em]{}{\songti\xiaosi\thecontentslabel\hspace{1em}}{}{\songti\xiaosi\titlerule*[5pt]{.}\contentspage}

\titleformat{\subsection}[hang]{\linespread{1}\heiti\shisanbang}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}{0em}{12pt}{6pt}
\titlecontents{subsection}[4em]{}{\songti\wuhao\thecontentslabel\hspace{1em}}{}{\songti\wuhao\titlerule*[5pt]{.}\contentspage}

\titleformat{\subsubsection}[hang]{\linespread{1}\heiti\xiaosi}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\chaptermark}[1]{\markright{#1}}
\renewcommand{\sectionmark}[1]{}
\fancypagestyle{frontmatter}{
  \fancyhf{}
  \fancyhead[L]{\xiaowu\songti 浙江大学计算机科学与技术学院本科毕业设计报告}
  \fancyhead[R]{\xiaowu\songti \rightmark}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
\fancypagestyle{mainmatter}{
  \fancyhf{}
  \fancyhead[L]{\xiaowu\songti 浙江大学计算机科学与技术学院本科毕业设计报告}
  \fancyhead[R]{\xiaowu\songti \thechapter \hspace{1em} \rightmark}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
\newcommand{\contentsformat}{\heiti\sanhao\bfseries}
\renewcommand{\contentsname}{目录}
\renewcommand\tableofcontents{
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsformat\contentsname}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    }
\renewcommand{\listfigurename}{\centerline{图~目~录}}
\renewcommand{\listtablename}{\centerline{表~目~录}}
\setcounter{tocdepth}{2}  % 设置目录的深度到 subsection
\renewcommand{\bibname}{参考文献}
\renewcommand{\nomname}{\centerline{术~语~表}}
\renewcommand{\nomlabelwidth}{25mm}
\renewcommand{\nompreamble}{\vspace{1em}}
\makenomenclature
\renewcommand{\figurename}{图} % 插图题头
\renewcommand{\tablename}{表} % 插表题头
\renewcommand{\captionlabeldelim}{} %% 定义如 "图(表)1: 示例" 中的间隔符号,如 ":" ,这里定义为空
\renewcommand{\captionlabelsep}{\hspace{1em}} %定义图表编号与标题间的间隔距离
\setlength{\belowcaptionskip}{2mm}
\renewcommand{\footnotesize}{\xiaowu}
\newtheoremstyle{zjutheorem}
   {9pt}{9pt}{\ttfamily}{0pt}{\lishu}{：}{0pt}{}
\theoremstyle{zjutheorem}
\newtheorem{zjuhypothsis}{假设~}[chapter]
\newtheorem{zjudefine}{定义~}[chapter]
\newtheorem{zjutheorem}{定理~}[chapter]
\newtheorem{zjuproposition}{命题~}[chapter]
\newenvironment{zjuproof}{\begin{proof}[\textnormal{\lishu 证明~}]}{\end{proof}}

% HACK
\let\oldcite=\cite
\renewcommand{\cite}[1]{\textsuperscript{\oldcite{#1}}}

\newcolumntype{.}{D{.}{.}{2.4}}
\AtBeginDocument{%
   \makeatletter
   \input{csbachelor.cfg}
   \makeatother}
\endinput
%%
%% End of file `csbachelor.cls'.
