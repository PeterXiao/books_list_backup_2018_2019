\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{USTBReport}

\RequirePackage{xkeyval,etoolbox}

\define@cmdkeys{USTBReport.cls}[USTB@Cover@]{%
  Course,
  Instructor,
  Location,
}

\define@cmdkeys{USTBReport.cls}[USTB@Report@]{%
  School,
  Major,
  Class,
  Name,
  Number,
  Year,
  Month,
  Day,
}
\ExecuteOptionsX{
  Course      = {},
  Instructor  = {},
  Location    = {},
  School      = 计通学院,
  Major       = 信息安全,
  Class       = 信安1601,
  Name        = 黄腾,
  Number      = 416245xx,
  Year        = \the\year,
  Month       = \the\month,
  Day         = \the\day,
}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptionsX\relax

\newcommand{\USTBset}[1]{\setkeys{USTBReport.cls}{#1}}

\LoadClass[11pt]{article}

\RequirePackage[UTF8,heading=true]{ctex}
\RequirePackage{geometry}
  \geometry{%
    a4paper,%
    hmargin = 2.54cm,%
    vmargin = 3.18cm,%
  }

\RequirePackage{graphicx,caption}
\RequirePackage[font=footnotesize]{subcaption}
  \graphicspath{{figures/}{figure/}{pictures/}{picture/}{fig/}{figs/}{image/}{images/}}
\renewcommand \thefigure
  {\ifnum \c@section>\z@ \thesection-\fi \@arabic\c@figure}
\DeclareCaptionFont{song}{\songti}
\captionsetup[figure]{%
  format=hang,%
  labelsep=quad,%
  font={song,small},%
  position=bottom
}
\captionsetup[table]{%
  format=hang,%
  labelsep=quad,%
  font={song,small},%
  position=top,%
}

\RequirePackage{array}
\RequirePackage{booktabs,tabularx}
\RequirePackage{makecell,interfaces-makecell,multirow}
\newcolumntype{Y}{>{\centering\arraybackslash}X}

\RequirePackage[shortlabels]{enumitem}
  % \AddEnumerateCounter{\chinese}{\chinese}{}

\def\maketitle{%
  \clearpage
  \setcounter{section}{0}
  {\centerline{\zihao{-2} \bfseries 北京科技大学实验报告}}
  \bigskip\noindent
    \makebox[4em][s]{学院}： \makebox[.2\linewidth][l]{\USTB@Report@School}
    \makebox[4em][s]{专业}： \makebox[.2\linewidth][l]{\USTB@Report@Major}
    \makebox[4em][s]{班级}： \makebox[.2\linewidth][l]{\USTB@Report@Class}
    \medskip
  \hrule
    \bigskip\noindent
    \makebox[4em][s]{姓名}： \makebox[.2\linewidth][l]{\USTB@Report@Name}
    \makebox[4em][s]{学号}： \makebox[.2\linewidth][l]{\USTB@Report@Number}
    \makebox[4em][s]{实验日期}： \makebox[.2\linewidth][l]{\USTB@Report@Year~年~\USTB@Report@Month~月~\USTB@Report@Day~日}
    \medskip
  \hrule
}

\newsavebox{\USTB}
\sbox{\USTB}{\includegraphics[width=4cm]{USTBlogo}}

\def\makecover{%
  \begin{titlepage}
    \begin{center}
      {\zihao{2} \bfseries 北京科技大学\quad 计算机与通信工程学院}\\
      \vspace*{2cm}
      {\zihao{1} \sffamily \bfseries \makebox[8em][s]{实验报告}}\\
      \vspace*{2cm}
      \usebox{\USTB}\\
      \vspace*{2cm}
      \ifstrempty{\USTB@Cover@Course}{}{\zihao{-3} \makebox[5em][s]{\bfseries 实验名称}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Cover@Course\hspace*{4em}}}\\[\bigskipamount]}
      {\zihao{-3} \makebox[5em][s]{\bfseries 学生姓名}：\CJKunderline{\makebox[15em][s]{\hspace*{6em}\USTB@Report@Name\hspace*{6em}}}\\[\bigskipamount]}{}
      {\zihao{-3} \makebox[5em][s]{\bfseries 专    业}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Report@Major\hspace*{4em}}}\\[\bigskipamount]}{}
      {\zihao{-3} \makebox[5em][s]{\bfseries 班    级}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Report@Class\hspace*{4em}}}\\[\bigskipamount]}{}
      {\zihao{-3} \makebox[5em][s]{\bfseries 学    号}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Report@Number\hspace*{4em}}}\\[\bigskipamount]}{}
      \ifstrempty{\USTB@Cover@Instructor}{}{\zihao{-3} \makebox[5em][s]{\bfseries 指导教师}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Cover@Instructor\hspace*{4em}}}\\[\bigskipamount]}
      {\zihao{-3} \makebox[5em][s]{\bfseries 实验成绩}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\hspace*{4em}}}\\[\bigskipamount]}{}
      \ifstrempty{\USTB@Cover@Location}{}{\zihao{-3} \makebox[5em][s]{\bfseries 实验地点}：\CJKunderline{\makebox[15em][c]{\hspace*{4em}\USTB@Cover@Location\hspace*{4em}}}\\[\bigskipamount]}
      {\zihao{-3} \makebox[5em][s]{\bfseries 实验时间}：\CJKunderline{\makebox[15em][s]{\quad\USTB@Report@Year~年~\USTB@Report@Month~月~\USTB@Report@Day~日\quad}}\\[\bigskipamount]}{}
    \end{center}
  \end{titlepage}
}

\renewcommand{\contentsname}{\bfseries \zihao{4} \centerline{目\quad 录}}

\ctexset{%
  section = {%
    numbering = false,%
    format += \bfseries\raggedright,%
  },%
  appendix = {%
    name = 附录,%
    number = \Alph{section},%
  }
}


\setmainfont{Times New Roman}
\setsansfont{Arial}
\setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={AdobeFangsongStd-Regular}]{Noto Serif CJK SC ExtraLight}
\setCJKsansfont[BoldFont={Noto Sans S Chinese Medium}]{Noto Sans S Chinese DemiLight}
\setCJKmonofont{WenQuanYi Micro Hei Mono Light}

\RequirePackage{fancyhdr,lastpage}
\fancyhf{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{第 \thepage 页~共 \pageref{LastPage} 页}

\RequirePackage{hyperref}
\AtBeginDocument{%
  \hypersetup{%
    pdfinfo={%
      Title    = {\@title},%
      Author   = {\USTB@Report@Name},%
    },%
    colorlinks = true,%
    hidelinks  = true,%
  }
}
\def\equationautorefname~#1\null{式(#1)\null~}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname~#1\null{第#1项\null}%
\def\figureautorefname~#1\null{图#1\null~}%
\def\tableautorefname~#1\null{表#1\null~}%
\def\partautorefname~#1\null{第#1部分\null}%
\def\appendixautorefname{附录}%
\def\chapterautorefname~#1\null{第#1章\null}%
\def\sectionautorefname~#1\null{第#1节\null}%
\def\subsectionautorefname~#1\null{第#1小节\null}%
\def\subsubsectionautorefname~#1\null{第#1小小节\null}%
\def\paragraphautorefname~#1\null{第#1段\null}%
\def\subparagraphautorefname~#1\null{第#1小段\null}%
\def\theoremautorefname{定理}%
% \def\pageautorefname~#1\null{第~#1~页\null}%
\def\HyRef@autopageref#1{%
  \hyperref[{#1}]{第~\pageref*{#1} 页}%
}

\RequirePackage{amsmath,amssymb,bm}
\RequirePackage{HTNotes-math,HTNotes-code}
