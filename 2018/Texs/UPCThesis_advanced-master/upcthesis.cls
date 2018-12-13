% 遵循 MIT Lincense 而保留以下声明
%	HustGraduPaper.cls
%	本文件是华中科技大学本科生毕业论文模板
%	@author skinaze
% 	@date 2018/01/20
%	@version v2.1.6
%
%	本模板遵循MIT License
%

% Contributer: Ionizing Radiation

% Todo list: 继续完成定制；修改hdr使之添加章节号；修改bfseries的 ``boldness''；修复标题页 学号 栏不齐的bug

%-----------------
%----定义新的类----
%-----------------
\def\UPC@name{upcthesis}
\def\UPC@date{1926/08/17}
\def\UPC@version{v0.0}
\def\UPC@introduction{An unofficial LaTeX template for UPCThesis}
\ProvidesClass{\UPC@name}[\UPC@date~\UPC@version~\UPC@introduction]
\NeedsTeXFormat{LaTeX2e}

%-------------------
%----定义类的选项----
%-------------------
\RequirePackage{xstring} % 条件语句包
\RequirePackage{makecell}
\def\UPC@fontset{}
\DeclareOption{autofont}{}
\DeclareOption{adobefont} {%
	\def\UPC@fontset{,fontset=adobe}
}
\DeclareOption{fandolfont} {%
	\def\UPC@fontset{,fontset=fandol}
}
\DeclareOption{founderfont} {%
	\def\UPC@fontset{,fontset=founder}
}
\DeclareOption{macfont} {%
	\def\UPC@fontset{,fontset=mac}
}
\DeclareOption{ubuntufont} {%
	\def\UPC@fontset{,fontset=ubuntu}
}
\DeclareOption{winfont} {%
	\def\UPC@fontset{,fontset=windows}
}
\DeclareOption{winnewfont} {%
	\def\UPC@fontset{,fontset=windowsnew}
}
\DeclareOption{winoldfont} {%
	\def\UPC@fontset{,fontset=windowsold}
}
\DeclareOption{nofont} {%
	\def\UPC@fontset{,fontset=none}
}

% 页脚样式
\def\UPC@footlinelength{6.7cm}
\DeclareOption{footline}{\def\UPC@footlinelength{6.7cm}}
\DeclareOption{nofootline}{\def\UPC@footlinelength{0cm}}
% 文献引用样式
\def\UPC@citestyle{normal}
\DeclareOption{normalcite}{\def\UPC@citestyle{normal}}
\DeclareOption{supercite}{\def\UPC@citestyle{super}}
\def\UPC@citebst{gbt7714-2005}
\DeclareOption{gbtcite}{\def\UPC@citebst{gbt7714-2005}}
\DeclareOption{gbt15cite}{\def\UPC@citebst{gbt7714-2015}}
\DeclareOption{thucite}{\def\UPC@citebst{thuthesis}}
% 查重协助
\DeclareOption{chachong}{\def\UPC@citebst{\chachong}}
\ProcessOptions
\ExecuteOptions{autofont, normalcites, gbtcite}
\relax

%-----------------
%----载入class----
%-----------------
\LoadClass[a4paper]{article}
% AutoFakeBold 表示伪粗的粗度
\RequirePackage[AutoFakeBold=1.28, AutoFakeSlant=true]{xeCJK}[2017/08/08]
\RequirePackage[zihao=-4, UTF8, heading=true\UPC@fontset]{ctex}[2016/12/27]

%-----------------
%----定义页边距----
%-----------------
\RequirePackage{geometry}
\geometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm}
\geometry{headsep=1em, footskip=2em}
\geometry{headheight=14pt}

%---------------
%----定义字体----
%---------------
% 设置正文常用字体
\setmainfont{Times New Roman}
\RequirePackage{fontspec}
% 封面使用华文中宋
\setCJKfamilyfont{hwzs}{STZhongsong}
\newcommand{\huawenzhongsong}{\CJKfamily{hwzs}}
\newfontfamily\hwzsAll{STZhongsong}[%
	BoldFont={STZhongsong},
	BoldFeatures={FakeBold=4}
]

%-------------------
%----定义页眉页脚----
%-------------------
% 使用fancyhdr
\RequirePackage{fancyhdr}
\RequirePackage{tikz}	% 绘制页脚线，由HustGradPaper.cls 遗留而来
% 非正文页页眉格式
\newcommand{\headstyleatbegin} {%
	\fancyhead[C]{\kaishu \zihao{5} 中国石油大学（华东）本科毕业设计（论文）}
}
% 正文页页眉格式，显示章节名
\newcommand{\headstyleatbody} {%
	\fancyhead[C]{\kaishu \zihao{5} \rightmark}
}
% 正文页脚格式，有页码
\newcommand{\footstyleatbody}{%
	\fancyfoot[C]{\huawenzhongsong \zihao{5} \thepage}
}

\pagestyle{fancy}
\fancyhf{}
\headstyleatbegin

% 正文的页面格式
\fancypagestyle{main}{%
	\fancyhf{}
	\headstyleatbody
	\footstyleatbody
}

\fancypagestyle{afterbody}{%
	\fancyhf{}
	\headstyleatbegin
	\footstyleatbody
}

% 页眉的定制	
\renewcommand\sectionmark[1]{%
%	\markright{\CTEXifname{\CTEXthesection----}{}#1}
	% 现在的问题是 \CTEXifname 没有起作用;
	%一个workaround是结合\thesection直接指定名称
	\markright{第\thesection 章~~#1}
}
% 移除subsectionmark,否则页眉会显示subsection的标题
\renewcommand\subsectionmark[1]{}	

\renewcommand{\baselinestretch}{1.62}
%\newcommand{\sectionbreak}{\clearpage}

\ctexset{
	section={%
		format={\centering \heiti \zihao{3}},
		name={第,章},
		aftertitle=\vspace{1.3em}
	},
	subsection={%
		format={\raggedright \heiti \zihao{4}}
	},
	subsubsection={%
		format={\raggedright \heiti \zihao{-4}}
	}
}

\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
	{0ex \@plus 1ex \@minus .2ex}%
	{1em}%
	{\normalfont \normalsize \bfseries}
}

\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
	{0ex \@plus 1ex \@minus .2ex}%
	{1em}%
	{\normalfont \normalsize \bfseries}
}

\RequirePackage[indentafter]{titlesec}
\newcommand{\sectionbreak}{\clearpage}

% 定制 \subsubsubsection 命令
\titleclass{\subsubsubsection}{straight}[\subsubsection]
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{%
%	\thesubsubsection . \arabic{subsubsubsection}
	% subsubsubsection 的 label 显示为 (1)
	(~\arabic{subsubsubsection}~)
}

\titleformat{\subsubsubsection}[block]{%
	\hspace{2em}\raggedright \zihao{-4}
}{\thesubsubsubsection}{0.5em}{}[]
\titlespacing*{\subsubsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{%
	1.5ex plus .2ex
}

\AtBeginDocument{%
	\def\toclevel@subsubsubsection{4}
	\def\toclevel@paragraph{5}
	\def\toclevel@subparagraph{6}
	\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
	\def\l@paragraph{\@dottedtocline{5}{11em}{5em}}
	\def\l@subparagraph{\@dottedtocline{6}{13em}{6em}}
}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% 设置附录样式
\RequirePackage[toc, titletoc, page, header]{appendix}
%\appendixtocon
%\appendixtitletocon
%\appendixpageon
%\appendixheaderon
% 重新定制附录的环境
\newenvironment{generalappendices}{
	\renewcommand\appendixpagename{\centering \makebox[2cm][s]{\zihao{3} 附录}}
	\renewcommand\appendixtocname{附录}
	\renewcommand\appendixname{sdfsdf}
	\renewcommand\thesection{}
%	\renewcommand{\cftsecindent}{12pt}
	\titleformat{\section}[block]{\raggedright\heiti\zihao{3}\bfseries}{\thesection}{0.5em}{}
	\titleformat{\appendixpagename}[block]{\centering}{}{0.5em}{}
	\clearpage
	\appendix
	\appendixpage
}{	
}



\def\sectionautorefname~#1\null{%
	第~#1~节\null
}
\def\subsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\subsubsectionautorefname~#1\null{%
	第~#1~小节\null
}
\def\paragraphautorefname~#1\null{%
	段落~#1~\null
}
\def\subparagraphautorefname~#1\null{%
	段落~#1~\null
}



\@addtoreset{footnote}{page}

\renewcommand{\thefigure}{%
	\ifnum \c@section > \z@ \thesection--\fi\@arabic\c@figure
}
\renewcommand{\thetable}{%
	\ifnum \c@section > \z@ \thesection--\fi\@arabic\c@table
}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}


% 设置图表 Caption 的样式
\RequirePackage{caption}
\DeclareCaptionFont{UPC}{\zihao{5} \songti}
\captionsetup{labelsep=quad}
\captionsetup{font={UPC, singlespacing}}
\captionsetup[figure]{position=bottom, skip={0pt}}
\captionsetup[table]{position=top, skip={0pt}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

% 重新设置图表 auto ref
\def\figureautorefname~#1\null{%
	图~#1~\null
}
\def\tableautorefname~#1\null{%
	表~#1~\null
}

% 使用 tabularx 库定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\ragerdright \arraybackslash}X}

% 添加复杂的表格宏
\RequirePackage{booktabs}
% 设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

% 添加图需要的库
\RequirePackage{graphicx}

% 重新定义图和表的浮动环境
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
	\centering
	\caption{\tabcaption} \label{\tablabel}
	}{
	\end{table}
}

% -------------------------
% ------设置公式格式--------
% -------------------------
\RequirePackage{amsmath}

% 设置公式间距为零
\AtBeginDocument{
	\setlength{\abovedisplayskip}{6pt}
	\setlength{\belowdisplayskip}{6pt}
	\setlength{\abovedisplayshortskip}{0pt}
	\setlength{\belowdisplayshortskip}{0pt}
}

% 公式编号带章节
%\numberwithin{equation}{section}


% 重新设置公式autoref
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}


%---------------------------
%-----定义列表项的样式--------
%---------------------------
\RequirePackage{enumitem}
\setlist{noitemsep}


%---------------------------
%-----   定义标题页  --------
%---------------------------
\RequirePackage{kvsetkeys}
% 添加文档的新属性
\def \@school {}
\def \@classnum {}
\def \@stuid {}
\def \@supervisor {}
\def \@subtitle {}
\def \@entitle {}
\def \@ensubtitle {}
\newcommand{\school}[1]{\def \@school{#1}}
\newcommand{\classnum}[1]{\def \@classnum{#1}}
\newcommand{\stuid}[1]{\def \@stuid{#1}}
\newcommand{\supervisor}[1]{\def \@supervisor{#1}}
\newcommand{\subtitle}[1]{\def \@subtitle{------#1}}
\newcommand{\ensubtitle}[1]{\def \@ensubtitle{------#1}}
\newcommand{\entitle}[1]{\def \@entitle{#1}}

% 设置 \maketitle 参数解析
\newcommand{\arg@maketitle}[2]{%
	\IfStrEqCase{#1}{%
		{logo color}{%
			\IfStrEqCase{#2}{%
				{green}{\def\UPC@titleColor{UPCLogo.png}}
				{black}{\def\UPC@titleColor{UPCLogo.png}}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (maketitle)}]
		}
		{line length}{\def\UPC@titlelength{#2}}
		{line font}{
			\IfStrEqCase{#2}{%
				{huawenzhongsong}{\def\UPC@titlelinefont{\huawenzhongsong}}
				{songti}		{\def\UPC@titlelinefont{\songti}}
				{heiti}		{\def\UPC@titlelinefont{\heiti}}
				{fangsong}	{\def\UPC@titlelinefont{\fangsong}}
				{kaishu}		{\def\UPC@titlelinefont{\kaishu}}
				{lishu}		{\def\UPC@titlelinefont{\lishu}}
				{youyuan}	{\def\UPC@titlelinefont{\youyuan}}
			}[\ClassWarning{\UPC@name}{Ther's no such value for #1 (maketitle)}]
		}
%		{subtitle}{
%%			\def\UPC@subtitle{\zihao{-2} \heiti \begin{flushright}------#2\end{flushright}%
%			%\vspace{-5.7em}%
%				\@subtitle
%			}	% 增加副标题选项
%		}
	}[\ClassWarning{\UPC@name}{There's no such argument for maketitle}]
}
\newcommand{\maketitlearg}[1]{%
	\IfSubStr{#1}{=}{%
		\kv@parse{#1}{\arg@maketitle}
	}{%
		\def\UPC@titlelength{#1}
	}
}
% 重置命令 maketitle
\renewcommand{\maketitle}[1][12em]{
%	\renewcommand{\thepage}{S\arabic{page}}
	\def\UPC@titlecolor{UPCLogo.png}
	\def\UPC@titlelength{12em}
	\def\UPC@titlelinefont{}
	\maketitlearg{#1}
	\begin{titlepage}
%		\vspace*{.5em}
		\flushleft
		\includegraphics[width=7.3cm, height=1.8cm]{\UPC@titlecolor}\\
		\begin{center}
			\vspace{5em}
			\makebox[\textwidth]{\zihao{-0} \heiti \bfseries 本\hfill 科\hfill 毕\hfill 业\hfill 设\hfill 计\hfill （论文）}\\
				\vspace*{36pt}
				
				\begin{flushleft}
				\hspace{0.8em}\zihao{-2} \heiti \makebox[3.3em]{题\hfill 目:} \@title
				\end{flushleft}
				\makebox[\textwidth][r]{\heiti \zihao{-2} \@subtitle}
%				\vspace{9.7em}
				\vfill
				{\zihao{3} \fangsong
					\renewcommand\arraystretch{1.5}
					\begin{tabular}{ll}
						\makebox[4.5em][s]{学生姓名:} &
						\makebox[3em][s]{\UPC@titlelinefont\@author}\\
						\makebox[4.5em][s]{学 \hfill 号:} &
						\makebox[\UPC@titlelength][l]{\UPC@titlelinefont\@stuid}\\
						\makebox[4.5em][s]{专业班级:} &
						\makebox[\UPC@titlelength][l]{\UPC@titlelinefont\@classnum}\\
						\makebox[4.5em][s]{指导教师:} &
						\makebox[3em][s]{\UPC@titlelinefont\@supervisor}\\
					\end{tabular}
				}\\
			\vspace*{5em}
			{\zihao{3} \fangsong \@date}\\		
		\end{center}
		\vspace{3em}
	\end{titlepage}
}

%----------------------------
%-------定义新的声明页面-------
%----------------------------
%使用特殊符号
\RequirePackage{amssymb}

% 设置statement的参数解析
\def\UPC@checkedbox{$\text{\rlap{\checkmark}}\square$}
\def\UPC@box{$\square$}
\newcommand{\arg@statement}[2]{%
	\IfStrEqCase{#1}{%
		{confidentiality}{%
			\IfStrEqCase{#2}{%
				{yes}{%
					\def\UPC@confidential{\UPC@checkedbox}
					\def\UPC@notconfidential{\UPC@box}
				}
				{no}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@checkedbox}
				}
				{false}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@checkedbox}
				}
				{empty}{
					\def\UPC@confidential{\UPC@box}
					\def\UPC@notconfidential{\UPC@box}
				}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (statement)}]
		}
		{year}{\def\UPC@yearofconfidentiality{#2}}	
	}[\ClassWarning{\UPC@name}{There's no such argument for statement}]
}
% 设置命令
\newcommand{\statement}[1][confidentiality=empty]{
	\def\UPC@confidential{\UPC@box}
	\def\UPC@notconfidential{\UPC@checkedbox}
	\def\UPC@yearofconfidentiality{}
	\kv@parse{#1}{\arg@statement}
	\clearpage
	\thispagestyle{empty}
	\vspace*{1em}
	\begin{center}
		\heiti \zihao{-2} \bfseries
		学位论文原创性声明
	\end{center}
	
	本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包括任何其他个人或集体已经发表或撰写的成果作品。本人完全意识到本声明的法律后果由本人承担。
	
	\rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	\vspace{4em}
	
	\begin{center}
		\heiti \zihao{-2} \bfseries
		学位论文版权使用授权书
	\end{center}
	
	本学位论文作者完全了解学校有关保障、使用学位论文的规定，同意学校保留并向有关学位论文管理部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权省级优秀学士论文评选机构将本学位论文的全部或部分内容编入有关数据进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。
	
	\begin{tabbing}
		\hspace{2em}本学位论文属于 \= 1、保密\hspace{1em} \=\HGP@confidential
		，在\makebox[2em][c]{\HGP@yearofconfidentiality}年解密后适用本授权书。\\
		\>2、不保密\>\HGP@notconfidential
		。\\
		\>（请在以上相应方框内打“$\checkmark$”）
	\end{tabbing}
	
	\rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	
	\rightline{导师签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	
	\clearpage
}
\newcommand{\makestatement}[2][]{\statement[confidentialily=#2, year=#1]}

%-----------------------------
%----定义新的中英文摘要环境------
%-----------------------------

%中文摘要环境
\newenvironment{cnabstract}[1]{
	\def\cnkeyword{#1}
	\clearpage
	\phantomsection
%	\addcontentsline{toc}{section}{摘要}
	\begin{center}
		\vspace*{1.5em}
		\makebox[\textwidth]{\heiti \zihao{-2} \@title}\\
		%
		\StrLen{\@subtitle}[\SubTitleLen]
		\ifnum \SubTitleLen > 0
			\makebox[\textwidth][r]{\heiti \zihao{-2} \@subtitle}
		\fi
		%
		\vspace{0.5em}
		\heiti \zihao{3} 摘 \hspace{1em} 要
	\end{center}
	%	后面一定要空出一行，否则摘要首字符不会缩进
	
}{
	\vspace{1.5em}
	\par\noindent
	{\songti \zihao{-4} \bfseries \hspace{0.85cm}关键词：}
	\cnkeyword
	\clearpage
}

\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
%	\addcontentsline{toc}{section}{Abstract}
	\begin{center}
		\vspace*{1em}
		\parbox[c]{\textwidth}{\heiti \bfseries \zihao{-2} \vspace*{0.5em} \@entitle
		\vspace{0.5em}}\\
		\StrLen{\@ensubtitle}[\EnSubTitleLen]
		\ifnum \EnSubTitleLen > 0
			\makebox[\textwidth][r]{\heiti \zihao{-2} \@ensubtitle}
		\fi
		\heiti \bfseries \zihao{3} Abstract 
	\end{center}
	%	后面一定要空出一行，否则摘要首字符不会缩进
	
}{
	\vspace{1.5em}
	\par\noindent
	{\zihao{-4} \bfseries \hspace{0.85cm}Keywords: }
	\enkeyword
	\clearpage
}

%----------------------
%----定义新的目录页面----
%----------------------
\RequirePackage[titles,subfigure]{tocloft}
\RequirePackage[colorlinks,citecolor=black]{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	pdfborder =000, %去掉链接红(黑)框
	pdfstartview=FitH	%打开页面以窗口宽度显示
}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \zihao{-2} \bfseries}
\renewcommand{\contentsname}{目\hspace{1.5em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cftafterloftitleskip}{0.5em}
\renewcommand{\cftsecdotsep}{0.5}{} %设置section引导点
\renewcommand{\cftsecleader}{\normalfont\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{0.5}
\renewcommand{\cftdot}{.}
\renewcommand{\cftsecindent}{0em}
\renewcommand{\cftsubsecindent}{1.9em}
\renewcommand{\cftsubsubsecindent}{3.8em}
\renewcommand{\cftsecnumwidth}{4em}
\renewcommand{\cftsubsecnumwidth}{1em}
\renewcommand{\cftsubsubsecnumwidth}{1em}
\renewcommand{\cftbeforesecskip}{0em} %设置段间距
\renewcommand{\cftpartfont}{\songti \bfseries} %设置part字体
\renewcommand{\cftsecfont}{\songti}
\renewcommand{\cftsecpagefont}{}
% 设置 \tableofcontents 参数解析
\newcommand{\arg@tableofcontents}[2]{
	\IfStrEqCase{#1}{
		{pagenum}{
			\IfStrEqCase{#2}{
			{yes}{\def\UPC@plainfooterstyle{\footstyle}}
			{true}{\def\UPC@plainfooterstyle{\footstyle}}
			{no}{\def\UPC@plainfooterstyle{}}
			{false}{\def\UPC@plainfooterstyle{}}
			}[\ClassWarning{\HGP@name}{There's no such value for #1 (tableofcontents)}]
		}
		{toc in toc}{
			\IfStrEqCase{#2}{
				{yes}{\def\UPC@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
					}}
				{true}{\def\UPC@addtoctotoc{
					\phantomsection
					\addcontentsline{toc}{section}{目录}
					}}
				{no}{\def\UPC@addtoctotoc{}}
				{false}{\def\UPC@addtoctotoc{}}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (tableofcontents)}]
		}
		{level}{\setcounter{tocdepth}{#2}}
		{section indent}{\renewcommand{\cftsecindent}{#2}}
		{subsection indent}{\renewcommand{\cftsubsecindent}{#2}}
		{subsubsection indent}{\renewcommand{\cftsubsubsecindent}{#2}}
		{subsubsubsection indent}{%
			\def\l@subsubsubsection{\@dottedtocline{4}{#2}{4em}}
		}
		{paragraph indent}{\def\l@paragraph{\@dottedtocline{5}{#2}{5em}}}
		{subparagraph indent}{\def\l@subparagraph{\@dottedtocline{5}{#2}{5em}}}
		{indent}{
			\IfStrEqCase{#2}{
				{normal}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{3em}
					\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{11em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{13em}{5em}}
				}
				{noindent}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{0em}
					\renewcommand{\cftsubsubsecindent}{0em}
					\def\l@subsubsubsection{\@dottedtocline{4}{0em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{0em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{0em}{5em}}
				}
				{UPCnoindent}{
					\def\l@section{\songti\normalfont\@dottedtocline{1}{0em}{3em}}
					\def\l@subsection{\normalfont\@dottedtocline{2}{0em}{3em}}
					\def\l@subsubsection{\normalfont\@dottedtocline{3}{0em}{4em}}
					\def\l@subsubsubsection{\normalfont\@dottedtocline{4}{0em}{5em}}
					\def\l@paragraph{\normalfont\@dottedtocline{5}{0em}{6em}}
				}
				{sameforsubandsubsub}{
					\renewcommand{\cftsecindent}{0em}
					\renewcommand{\cftsubsecindent}{1.5em}
					\renewcommand{\cftsubsubsecindent}{1.5em}
					\def\l@subsubsubsection{\@dottedtocline{4}{1.5em}{4em}}
					\def\l@paragraph{\@dottedtocline{5}{1.5em}{5em}}
					\def\l@subparagraph{\@dottedtocline{5}{1.5em}{5em}}
				}
			}[\ClassWarning{\UPC@name}{There's no such value for #1 (tableofcontents)}]
		}
		{abstract}{
			\IfStrEqCase{#2}{
				{true}{\def\UPC@addabstracttotoc{
					\phantomsection
					\addcontentsline{toc}{section}{Abstract}
					\phantomsection
					\addcontentsline{toc}{section}{摘要}
					}
				}
				{yes}{\def\UPC@addabstracttotoc{
					\phantomsection
					\addcontentsline{toc}{section}{Abstract}
					\phantomsection
					\addcontentsline{toc}{section}{摘要}
					}
				}
				{no}{\def\UPC@addabstracttotoc{}}
				{false}{\def\UPC@addabstracttotoc{}}
			}
		}
	}[\ClassWarning{\UPC@name}{There's no such argument for tableofcontents}]
}

\AtBeginDocument{
	% 设置新的生成目录命令
	\let \oldtableofcontents \tableofcontents
	\renewcommand{\tableofcontents}[1][pagenum=false, toc in toc=false, level=3, abstract=false]{
		\def\UPC@plainfooterstyle{}
		\def\UPC@addtoctotoc{}
		\def\UPC@addabstracttotoc{}
		\kv@parse{#1}{\arg@tableofcontents}
		% 修改 hdr(header) 原 plain 格式
		\fancypagestyle{plain}{%
			\fancyhf{} % 清空原有样式
			\headstyleatbegin %%%%%%%% to do here
			\UPC@plainfooterstyle
		}
		% 设置目录 hdr 和页码选项
		\clearpage
		\pagestyle{plain}
		\UPC@addtoctotoc
		\UPC@addabstracttotoc
		\oldtableofcontents
		\clearpage
		\pagestyle{main}
		\setcounter{page}{1}
	}
	% 旧命令
	\newcommand{\maketoc}[1][nopagenum]{
		\IfStrEqCase{#1}{
			{nopagenum}{\tableofcontents[pagenum=false, toc in toc=false]}
			{pagenum}{\tableofcontents[pagenum=true, toc in toc=false]}
			{pagenumtoc}{\tableofcontents[pagenum=true, toc in toc=true]}
		}
	}
	
	\renewcommand{\thepage}{\arabic{page}}
}

%----------------------
%----定义新的致谢环境----
%----------------------
\newenvironment{thankpage}{
	\clearpage
	\pagestyle{afterbody}
	\phantomsection
	\addcontentsline{toc}{section}{致谢}
	\section*{致\hspace{0.6cm}谢}
}{
	\clearpage
}


%------------------------
%----重新定义参考文献页----
%------------------------
% 设置参考文献 
\usepackage[square]{natbib}
\setlength{\bibhang}{0pt}
\setcitestyle{numbers, square, comma}
\ctexset{bibname={参考文献}}

% 正常引用和上标引用
\let \normalcite \cite
\newcommand{\supercite}[2][]{
	\unskip
	\def\UPC@temp{#1}
	\ifx\UPC@temp\empty{\unskip\textsuperscript{\normalcite{#2}}}
	\else{\unskip\textsuperscript{\normalcite[#1]{#2}}}\fi
}
\IfStrEqCase{\UPC@citestyle}{
	{normal}{}
	{super}{\let \cite \supercite}
}

% 设置参考文献样式
\IfStrEqCase{\UPC@citebst}{
	{gbt7714-2005}{\bibliographystyle{gbt7714-2005}}
	{gbt7714-2015}{\bibliographystyle{gbt7714-2015}}
	{thuthesis}{
		\bibliographystyle{thuthesis}
		\def\thudot{\unskip.}
	}
}

% 设置新的参考文献
\let \oldbibliography \bibliography
\renewcommand{\bibnumfmt}[1]{\makebox[1.5em][l]{[#1]}}
\renewcommand{\bibliography}[1]{
	% 添加到目录
	\clearpage
	\pagestyle{afterbody}
	\phantomsection
	\addcontentsline{toc}{section}{参考文献}
	\oldbibliography{#1}
}

%---------------
%----其他设置----
%---------------
% PDF文件信息设置
\AtBeginDocument{
	\hypersetup{
		pdfinfo={
			Title={\@title}
			Author={\@author}
			Subject={中国石油大学（华东）本科生毕业论文}
		}
	}
}

% 查重识别问题
\def\UPC@Otherbold{}
\newcommand{\OtherBold}[1]{\def\UPC@Otherbold{#1}}
\newcommand{\chachong}{
	\clearpage
	
	{\heiti\zihao{1}\noindent 这部分用于加粗的复制，便于查重。请从这里开始删除！}
	{\huawenzhongsong 中国石油大学（华东）毕业设计（论文）}
	{\huawenzhongsong 本科生毕业设计（论文）}
	{\heiti \@title 学生姓名 学号 专业班级 指导教师}
	{\heiti \@title \@school \@author \@stuid \@classnum \@supervisor}
	{\heiti 学位论文原创性声明 学位论文版权使用授权书 摘要 关键词 目录 致谢 参考文献 附录}
	{\sonti 宋体}
	
	{\heiti \zihao{1}\noindent 一直删除到这里！}
	
	\UPC@Otherbold
	
	\clearpage
}

% 2018/2/9 22:03