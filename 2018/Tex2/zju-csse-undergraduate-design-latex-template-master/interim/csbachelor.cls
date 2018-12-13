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
\RequirePackage[top=2.0cm,bottom=2.4cm,left=3.4cm,right=2.4cm,includefoot]{geometry}

\RequirePackage{ifthen}
\RequirePackage{calc}

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
\setlength{\headheight}{27pt}
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

\renewcommand{\baselinestretch}{1.5}
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
\DeclareRobustCommand{\fangsong}{\CJKfamily{FangSong}}
\DeclareRobustCommand{\stfangsong}{\CJKfamily{STFangsong}}
\DeclareRobustCommand{\stxingkai}{\CJKfamily{STXingkai}}
\DeclareRobustCommand{\heiti}{\CJKfamily{HeiTi}}
\DeclareRobustCommand{\kaiti}{\CJKfamily{KaiShu}}
\DeclareRobustCommand{\lishu}{\CJKfamily{LiShu}}
\DeclareRobustCommand{\songti}{\CJKfamily{SongTi}}
\DeclareRobustCommand{\youti}{\CJKfamily{YouYuan}}
\setcounter{secnumdepth}{4}

% 张海
\renewcommand*{\thesection}{\arabic{section}.}
\renewcommand*{\thefigure}{\arabic{figure}}
\renewcommand*{\thetable}{\arabic{table}}

% 张海
%\titleformat{\chapter}[block]{\sanhao\heiti\filcenter}{第 \thechapter{} 章}{1em}{}{}
\titleformat{\chapter}[block]{\xiaoer\songti\bfseries\filcenter}{}{0em}{}{}
\titlespacing{\chapter}{0em}{0em}{\baselineskip}
% 张海
%\titlecontents{chapter}[1.5em]{}{第 \thecontentslabel{} 章\hspace{1em}}{}{\titlerule*[10pt]{.}\contentspage}
\titlecontents{chapter}[1.5em]{}{\songti\sihao\bfseries}{}{\songti\sihao\bfseries\titlerule*[5pt]{.}\contentspage}

% 张海
%\titleformat{\section}[hang]{\sihao\heiti}{\thesection}{1em}{}{}
\titleformat{\section}[hang]{\sanhao\heiti\bfseries}{\thesection}{1em}{}{}
\titlespacing{\section}{0em}{\baselineskip}{\baselineskip}
% 张海
%\titlecontents{section}[2.2em]{}{\hspace{1em}\thecontentslabel\hspace{1em}}{}{\titlerule*[7pt]{.}\contentspage}
\titlecontents{section}[3em]{}{\thecontentslabel\hspace{1em}}{}{\titlerule*[5pt]{.}\contentspage}

\titleformat{\subsection}[hang]{\xiaosi\heiti}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}{0em}{\baselineskip}{\baselineskip}
\titlecontents{subsection}[5em]{}{\thecontentslabel\hspace{1em}}{}{\titlerule*[5pt]{.}\contentspage}

\titleformat{\subsubsection}[hang]{\xiaosi}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{0.0\baselineskip}{0.0\baselineskip}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
% 张海
%\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancypagestyle{toc}{
  \fancyhf{}
  \fancyhead[C]{\songti\xiaowu 浙江大学本科毕业设计~开题报告}
}
\fancypagestyle{kaitibaogao}{
  \fancyhf{}
  %\fancyhead[L]{\xiaowu\songti 浙江大学计算机科学与技术学院本科毕业设计}
  %\fancyhead[R]{\xiaowu\songti\leftmark}
  \fancyhead[C]{\songti\xiaowu 浙江大学本科毕业设计~开题报告}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
\fancypagestyle{waiwenfanyi}{
  \fancyhf{}
  %\fancyhead[L]{\xiaowu\songti 浙江大学计算机科学与技术学院本科毕业设计}
  %\fancyhead[R]{\xiaowu\songti\leftmark}
  \fancyhead[C]{\songti\xiaowu 浙江大学本科毕业设计~外文翻译}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
%\fancyhf{}
%\fancyhead[L]{\xiaowu\songti 浙江大学计算机科学与技术学院本科毕业设计}
%\fancyhead[R]{\xiaowu\songti\leftmark}
%\fancyfoot[C]{\xiaowu\thepage}
\renewcommand{\contentsname}{\centerline{\heiti\sanhao\mdseries 目~录}}
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
\newcolumntype{.}{D{.}{.}{2.4}}
\AtBeginDocument{%
   \makeatletter
   \input{csbachelor.cfg}
   \makeatother}
\endinput
%%
%% End of file `csbachelor.cls'.
