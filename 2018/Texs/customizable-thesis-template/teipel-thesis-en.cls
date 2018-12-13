%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	Template for typesetting Academic Theses in English (pdfLaTeX version)
%%
%%	John Liaperdos, October 2014 - February 2018
%%	(ioannis.liaperdos@gmail.com)
%%	(sites.google.com/site/liaperdos)
%%
%%
%%	Last update: Feb 19, 2018
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

% Class Information
\def\filename{teipel-thesis-en}
\def\fileversion{1.3}
\def\filedate{2018/02/19}
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{teipel-thesis-en}[%
    \filedate\space\fileversion\space LaTeX document class.]    
% Required Packages
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}

%% class options
\newif\ifletteroption
\letteroptionfalse
\newif\ifwatermarkoption
\newif\ifmodernoption
\newif\ifhyperrefoption
\newif\ifprinteroption
\newif\ifhistinitoption
\newif\ifplainoption
\newif\ifnoindexoption
\newif\ifminitocoption
\printeroptionfalse
\hyperrefoptionfalse
\watermarkoptionfalse
\modernoptionfalse
\histinitoptionfalse
\plainoptionfalse
\noindexoptionfalse
\minitocoptionfalse
\newif\iffrontispieceoption
\frontispieceoptionfalse
\DeclareOption{classic}{
	\modernoptionfalse
}	
\DeclareOption{modern}{
	\modernoptiontrue
}
\DeclareOption{hyperref}{
	\hyperrefoptiontrue
}
\DeclareOption{watermark}{
	\watermarkoptiontrue
}
\DeclareOption{printer}{
	\printeroptiontrue
}
\DeclareOption{histinit}{
	\histinitoptiontrue
}
\DeclareOption{plain}{
	\plainoptiontrue
}    
\DeclareOption{noindex}{
	\noindexoptiontrue
}
\DeclareOption{frontispiece}{
	\frontispieceoptiontrue
}	
    
\DeclareOption{letter}{
  \letteroptiontrue
}

\DeclareOption{minitoc}{
  \minitocoptiontrue
}

%% Process options
\ProcessOptions\relax

%% Load `book' class
\ifletteroption
	\LoadClass[letterpaper,11pt,english,twoside]{book}
\else
	\LoadClass[a4paper,11pt,english,twoside]{book}
\fi

\usepackage[english]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\providecommand\phantomsection{}
\usepackage{varwidth}
\usepackage{xstring}
\usepackage{substr}
\usepackage{array}
\usepackage{calculator}
\usepackage[hyphens]{url}
\usepackage{relsize} % used for font scaling

\pagestyle{fancy}

% Define macros to set thesis variables
\def\@supervisor{}              
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@firstExaminer{}               
\def\firstExaminer#1{\gdef\@firstExaminer{#1}}
\def\@secondExaminer{}               
\def\secondExaminer#1{\gdef\@secondExaminer{#1}}
\def\@subtitle{}                    
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@translator{}              
\def\translator#1{\gdef\@translator{#1}}
\def\@institution{}             
\def\institution#1{\gdef\@institution{#1}}
\def\@department{}              
\def\department#1{\gdef\@department{#1}}
\def\@division{}                    
\def\division#1{\gdef\@division{#1}}
\def\@lab{}                             
\def\lab#1{\gdef\@lab{#1}}
\def\@other{}                           
\def\other#1{\gdef\@other{#1}}
\def\@dedication{}              
\def\dedication#1{\def\@dedication{#1}}
\def\@uppertitleback{}      
\long\def\uppertitleback#1{\def\@uppertitleback{#1}}
\def\@middletitleback{}   
\long\def\middletitleback#1{\def\@middletitleback{#1}}
\def\@lowertitleback{}    
\long\def\lowertitleback#1{\def\@lowertitleback{#1}}
\def\@approval{}   
\long\def\approval#1{\def\@approval{#1}}
\def\@chaptercolor{}              
\def\chaptercolor#1{\gdef\@chaptercolor{#1}}
\def\@appendixcolor{}              
\def\appendixcolor#1{\gdef\@appendixcolor{#1}}
\def\@thesisurlcolor{}              
\def\hyperlinkcolor#1{\gdef\@thesisurlcolor{#1}}
\def\@thesistitlecolor{}              
\def\titlecolor#1{\gdef\@thesistitlecolor{#1}}
\def\@frontpagetitlefillcolor{}              
\def\titlebackgroundcolor#1{\gdef\@frontpagetitlefillcolor{#1}}
\def\@keywordsGR{}              
\def\keywordsGR#1{\gdef\@keywordsGR{#1}}
\def\@keywordsEN{}              
\def\keywordsEN#1{\gdef\@keywordsEN{#1}}
\def\@subjectArea{}              
\def\subjectArea#1{\gdef\@subjectArea{#1}}
\def\@authorNameCapital{}   
\def\authorNameCapital#1{\gdef\@authorNameCapital{#1}}
\def\@authorName{}   
\def\authorName#1{\gdef\@authorName{#1}}
\def\@supervisorTitle{}   
\def\supervisorTitle#1{\gdef\@supervisorTitle{#1}}
\def\@thesisPlaceDate{}
\def\thesisPlaceDate#1{\gdef\@thesisPlaceDate{#1}}
\def\@ackPlaceDate{}
\def\ackPlaceDate#1{\gdef\@ackPlaceDate{#1}}
\def\@examinationDate{}
\def\examinationDate#1{\gdef\@examinationDate{#1}}
\def\@firstExaminerTitle{}
\def\firstExaminerTitle#1{\gdef\@firstExaminerTitle{#1}}
\def\@secondExaminerTitle{}
\def\secondExaminerTitle#1{\gdef\@secondExaminerTitle{#1}}
\def\@copyrightYear{}
\def\copyrightYear#1{\gdef\@copyrightYear{#1}}
\def\@UniversityName{}
\def\UniversityName#1{\gdef\@UniversityName{#1}}
\def\@DepartmentName{}
\def\DepartmentName#1{\gdef\@DepartmentName{#1}}
\def\@SchoolName{}
\def\SchoolName#1{\gdef\@SchoolName{#1}}
\def\@UniversityLocation{}
\def\UniversityLocation#1{\gdef\@UniversityLocation{#1}}
\def\@ThesisType{}
\def\ThesisType#1{\gdef\@ThesisType{#1}}
\def\@UniversityLogoPath{logo/teikal_logo.eps}
\def\UniversityLogoPath#1{\gdef\@UniversityLogoPath{#1}}
\def\@UniversityBWLogoPath{logo/teikal_logo_BW.eps}
\def\UniversityBWLogoPath#1{\gdef\@UniversityBWLogoPath{#1}}
\def\@approvalStatement{}
\def\approvalStatement#1{\gdef\@approvalStatement{#1}}
\def\@draftIndication{--- DRAFT ---}
\def\draftIndication#1{\gdef\@draftIndication{#1}}
\def\@LogoScaleFactor{1}
\def\LogoScaleFactor#1{\gdef\@LogoScaleFactor{#1}}
\def\TRnumber#1{\gdef\@TRnumber{#1}}
\def\@trurl{}             
\def\trurl#1{\gdef\@trurl{\texttt{#1}}}
\def\@trftp{}             
\def\trftp#1{\gdef\@trftp{\texttt{#1}}}
\def\@usecoverpageimage{}
\def\@coverpageimagetikzcommands{}
\def\@coverpageimagefilename{}
\def\@coverpageimagescalefactor{}
\newcommand\coverpageimage[3][]{
    \gdef\@usecoverpageimage{1}
    \gdef\@coverpageimagescalefactor{#2}
    \IfStrEq{#1}{tikz}
    {
        \gdef\@coverpageimagetikzcommands{#3} 
    }
    {
        \gdef\@coverpageimagefilename{#3}
    }
}
\newcommand\setFrontispiece[3][1]{%
	\edef\frontispiecescalefactor{#1}%
	\edef\frontispieceimagepath{#2}%
	\edef\frontispiecelegend{#3}%
}
\newcommand\typesetFrontispiece{%
	\ifx\frontispieceimagepath\@empty%
	\else% 
		~\vfill%
		\scalebox{\frontispiecescalefactor}{\includegraphics[width=\textwidth]{\frontispieceimagepath}}%
		\\[5pt]%
		\textit{\frontispiecelegend}%
		\\%
		~\vfill%
	\fi%
}

\def\new@tpage{\newpage\thispagestyle{empty}\null}

% Measurements
% a4 (210 x 297)
\setlength{\oddsidemargin}{7mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{150mm}
\setlength{\topmargin}{10pt}
\setlength{\textheight}{245mm}
\setlength{\headheight}{50pt}
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep
% letter (215.9 x 279.4)
\ifletteroption
	\addtolength\textwidth{5.9mm}
	\addtolength\textheight{-17.6mm}
\fi


% Define color variables
\edef\titlepageshadecolor{}
\edef\colouredtextcolor{}
\edef\appendixcolouredtextcolor{}
\edef\logoshadecolor{}
\edef\titlefillcolor{}

\newcommand\preprocess{%
    % scale some fonts ("plain" option only)
        \ifmodernoption
            \def\chapterTitleScaleFactor{0.93}
        \else
            \def\chapterTitleScaleFactor{0.8}
        \fi
	% choose colors:
    	\ifprinteroption
    		\edef\@chaptercolor{black!70}
        	\edef\@appendixcolor{black!60}
            \edef\indexcolor{gray}
        	\edef\titlepageshadecolor{white}
        	\edef\colouredtextcolor{black!75}
        	\edef\appendixcolouredtextcolor{black!85}
        	\edef\logoshadecolor{white}
        	\edef\@thesisurlcolor{black}
        	\edef\@thesistitlecolor{black}
        	\edef\@frontpagetitlefillcolor{white}
            \edef\titlefillcolor{\@chaptercolor}
            % set grayscale logo
                \edef\logopath{\@UniversityBWLogoPath}
    	\else
    	    % set color logo
    	        \edef\logopath{\@UniversityLogoPath}
    	    % check for undefined colors
    	        \ifx \@chaptercolor \@empty
    	            \message{LaTeX Warning: (teipel-thesis-en.cls): %
        			 Chapter color undefined. Using default.}%
        			 \typeout{ }%
        			 \def\@chaptercolor{brown!60!red}
    	        \else
    	        \fi
    	        \ifx \@appendixcolor \@empty
    	            \message{LaTeX Warning: (teipel-thesis-en.cls): %
        			 Appendix color undefined. Using default.}%
        			 \typeout{ }%
        			 \def\@appendixcolor{brown!60!orange}
    	        \else
    	        \fi
    	        \ifhyperrefoption
    	            \ifx \@thesisurlcolor \@empty
    	                \message{LaTeX Warning: (teipel-thesis-en.cls): %
        			    Hyperlink color undefined. Using default.}%
        			    \typeout{ }%
        			    \def\@thesisurlcolor{blue}
    	            \else
    	            \fi 
    	        \else
    	            \def\@thesisurlcolor{black}
    	        \fi
    	        \ifplainoption
    	        \else
    	            \ifx \@thesistitlecolor \@empty
    	                \message{LaTeX Warning: (teipel-thesis-en.cls): %
        			    Title color (cover page) undefined. Using default.}%
        			    \typeout{ }%
        			    \def\@thesistitlecolor{white}    	        
    	            \else
    	            \fi 
    	            \ifx \@frontpagetitlefillcolor \@empty
    	                \message{LaTeX Warning: (teipel-thesis-en.cls): %
        			    Title background color (cover page) undefined. Using chapter color.}%
        			    \typeout{ }%
        			    \def\@frontpagetitlefillcolor{\@chaptercolor}    	        
    	            \else
    	            \fi      	            
    	        \fi
    		\edef\indexcolor{\@appendixcolor}
			\edef\titlepageshadecolor{gray!50}
			\edef\colouredtextcolor{\@chaptercolor!70!black}
			\edef\appendixcolouredtextcolor{\@appendixcolor!70!black}
			\edef\logoshadecolor{\@chaptercolor}
            \edef\titlefillcolor{\@chaptercolor}
    	\fi
    % change equation number color
        \ifplainoption
            \makeatletter
                \def\tagform@##1{\maketag@@@{%
                    \color{\colouredtextcolor}(##1)\@@italiccorr}}
            \makeatother
        \else

            \makeatletter
                \def\tagform@##1{\maketag@@@{%
                    \colorbox{\colouredtextcolor}{\color{white}##1\@@italiccorr}}}
            \makeatother
        \fi
}

%%%
% Modify title command 
    \def\@titleincoverpage{}
	\let\oldtitle\title
	\renewcommand\title[2][]{%
		\oldtitle{#2}%
        \IfStrEq{#1}{}
            {
                \gdef\@titleincoverpage{#2}
            }
            {
                \gdef\@titleincoverpage{#1}
            }		
	}
% Format author strings  
\newcommand\compileauthors{%
       \def\pdflistofauthors{\@authorName}        
    \edef\@authorNameCapital{\@authorName}
    \author{\pdflistofauthors}%
}
%%%

% Maketitle 
\newcommand\formatauthorstring{%
	\fullexpandarg\StrSubstitute{\@authorNameCapital}{,}{\protect\break}%
    [\formatedauthorstring]
}
\renewcommand{\maketitle}{
    \formatauthorstring%
    \begin{titlepage}
        \let\footnotesize\small
        \let\footnoterule\relax
        \renewcommand{\thefootnote}{\fnsymbol{footnote}}
        \new@tpage
        % place  Logo
        	\ifplainoption
            	\vspace{-2cm}
            	\begin{center}
                	\hfill
                	\color{\colouredtextcolor}\raisebox{1.25cm}{\rule{6cm}{1pt}}
                    \hfill
                	\scalebox{\@LogoScaleFactor}{\includegraphics[width=2.5cm]{\logopath}}
                    \hfill
                    \color{\colouredtextcolor}\raisebox{1.25cm}{\rule{6cm}{1pt}}
                    \hfill
                \end{center}
                \vspace{-12pt}
            \else
            \ifletteroption%
            		\edef\coverpagelogoxshift{-0.3cm}%
            \else%
            	\edef\coverpagelogoxshift{0cm}%
            \fi%
            	\begin{tikzpicture}[remember picture,overlay]
	    			\node[align=left,xshift=\coverpagelogoxshift,%
	    				yshift=\coverpagelogoxshift-2.4cm] at (current page.north west)
	     			 	{
				      	\begin{tikzpicture}[remember picture, overlay]
				      		\shade[left color=\titlepageshadecolor, %
                            right color=white, draw=none] (0,0) rectangle
				          	(1cm,-\paperheight);
				        	\draw[fill=\titlepageshadecolor] (-5cm,0) rectangle
				          	(\paperwidth + 10cm,3cm);
				        	\node[align=center,xshift=\marginparwidth -2\marginparsep +%
                            0.5*(\textwidth),rectangle,
				            rounded corners=17pt,inner sep=8pt,
				            fill=\logoshadecolor!70, fill opacity=0.5, text opacity=1] 
				            {\scalebox{\@LogoScaleFactor}{\includegraphics[width=2.5cm]{\logopath}}};
				       \end{tikzpicture}
	       	      	};
	   			\end{tikzpicture}
	   			\centering\\[10pt]
            \fi
	    \centering
        \Large\textsc{\@institution} \\
        \large\textsc{\@department} \\
        \textsc{\@division} \\
        \vspace{0.5cm}
        \vfill
        \ifplainoption
            \huge \textscale{\chapterTitleScaleFactor}{%
            \color{\colouredtextcolor}\textbf{\@titleincoverpage}}
        \else
            \scalebox{0.9}{%
				\begin{tikzpicture}			     
				    \node[align=center,rectangle,
                        rounded corners=10pt,inner sep=11pt,
                        shade, top color=\@frontpagetitlefillcolor, %
                        bottom color=\@frontpagetitlefillcolor!70] 
                        {\Large\color{\@thesistitlecolor}\chapterlabel%
                        \begin{varwidth}[t]{1.1\textwidth}
                            \centering\huge \bfseries %
                            \textscale{\chapterTitleScaleFactor}{\@titleincoverpage}%
                        \end{varwidth}};
                \end{tikzpicture}
	       	}
        \fi
        \\[10pt]
        \ifx\@subtitle\@empty
        \else
            \Large \textcolor{\colouredtextcolor}{\textit{\@subtitle}}\\
            {\color{\colouredtextcolor}\rule{3cm}{1pt}}
            \color{black}
        \fi
        %
        \vspace{0.1cm}
        %
        \vfill
        \LARGE \textcolor{\colouredtextcolor}{\textsc{\textscale{\chapterTitleScaleFactor}{%
            \@translator}}}
        \\[20pt]
        \normalsize% 
        \ifx\formatedauthorstring\@empty% 
            % do nothing
        \else% 
            \LARGE\textcolor{\colouredtextcolor}%
            {\textscale{\chapterTitleScaleFactor}{\textbf{\MakeUppercase{%
            \formatedauthorstring}}}}% 
        \fi% 
        \vspace{0.2cm}
        \vfill        
        %
	    \ifx\@usecoverpageimage\@empty
        \else
            \begin{center}
                \ifx\@coverpageimagefilename\@empty
                    \ifx\@coverpageimagetikzcommands\@empty
                        \message{LaTeX Warning: (teipel-thesis-en.cls): %
            			No TikZ commands defined by \@backslashchar coverpageimage. %
            			Cover page image is omitted.}%
            			\typeout{ }
                    \else
                        \begin{tikzpicture}[scale=\@coverpageimagescalefactor]
                            \ifprinteroption
                                \selectcolormodel{gray}
                            \fi                        
                            \@coverpageimagetikzcommands
                        \end{tikzpicture}
                    \fi
                \else
                    \includegraphics[scale=\@coverpageimagescalefactor]{\@coverpageimagefilename}
                \fi
            \end{center}
        	\vspace{0.2cm}            
        \fi                 
        %
        \hspace{1mm}
        \begin{flushleft}
            \normalsize
            \begin{tabbing}
                \large \textcolor{\colouredtextcolor}%
                    {\textbf{Supervisor:}} \=\@supervisor\\
                    \>\@supervisorTitle
            \end{tabbing}
        \end{flushleft}
        \vspace{0.2cm}
        \vfill
        %
        \ifplainoption
            \ifwatermarkoption
                \vfill
                \textcolor{gray}{\Large \@draftIndication}
                \vfill
            \fi       
        \fi
        %
        \vspace{0.2cm}
        \vfill
        \normalsize \@thesisPlaceDate\\
        \ifplainoption
            \color{\colouredtextcolor}\rule{\textwidth}{1.5pt}\color{black}
        \else
            \tikz\shade[left color=\colouredtextcolor, %
                right color=\colouredtextcolor!40, draw=none] (0,0) %
                rectangle (\textwidth,0.8pt);
        \fi
            %
            \iffrontispieceoption
            		\clearpage
            		\thispagestyle{empty}
            		\typesetFrontispiece
            		\clearpage
            \else
            		\cleardoublepage
            \fi
            %
            \if@twoside\new@tpage
                \vspace{-1cm}
                \noindent
                \begin{minipage}[t]{\textwidth}
                    \@uppertitleback
                \end{minipage}
                \vspace{0.5cm}
                \vfill
                \centering
                \LARGE \textbf{\textcolor{\colouredtextcolor}{\@title}}
            	\ifx\@subtitle\@empty
                \else
                    \\[12pt]
                    \Large \textcolor{\colouredtextcolor}{\textit{\@subtitle}}\\
                    {\color{\colouredtextcolor}\rule{3cm}{1pt}}
                \fi
                %
                \vspace{0.1cm}
                \vfill
                %
                \LARGE{\textcolor{\colouredtextcolor}{\textscale{\chapterTitleScaleFactor}{%
                    \textsc{\@translator}}}}
                \\[20pt]
                \normalsize%            
                \ifx\formatedauthorstring\@empty% 
                    % do nothing
                \else% 
                    {\LARGE\textcolor%
                	{\colouredtextcolor}%
                    {\textbf{\MakeUppercase{%
                    \textscale{\chapterTitleScaleFactor}{\formatedauthorstring}}}}}% 
                \fi% 
                %
                \vspace{5mm}
                \vfill
                %
                \begin{tabbing}
                    \large \textcolor{\colouredtextcolor}%
                    {\textbf{Supervisor:}} \=\@supervisor\\
                    \>\@supervisorTitle
                \end{tabbing}
                \vspace{5mm}
                \vfill
                \@approval
                \vfill
                \vspace{1cm}
                \@thesisPlaceDate
            %
            \fi
            \new@tpage
            \cleardoublepage
            \if@twoside\new@tpage
                \noindent
                \begin{minipage}[t]{\textwidth}
                    \@uppertitleback
                \end{minipage}
                \par
                \vfill
                \noindent
                \begin{minipage}{\textwidth}
                    \@middletitleback
                \end{minipage}
                \par
                \vfill
                \noindent
                \begin{minipage}[b]{\textwidth}
                    \@lowertitleback
                \end{minipage}
            \fi
    \end{titlepage}
    %
    \renewcommand{\thefootnote}{\arabic{footnote}}
    \setcounter{footnote}{0}
    %
    \gdef\@thanks{}\gdef\@author{}\gdef\@translator{}\gdef\@institution{}
    \gdef\@department{}\gdef\@division{}\gdef\@lab{}\gdef\@other{}
    \gdef\@uppertitleback{}\gdef\@lowertitleback{}\gdef\@dedication{}%
    \gdef\@title{}\gdef\@subtitle{}\let\maketitle\relax%
}


% Names
\newcommand{\keywordsname}{Keywords}% 
\newcommand{\abstractname}{Abstract}% 
\newcommand{\prefacename}{Preface}% 
\newcommand{\acknowledgementsname}{Acknowledgements}% 
\newcommand{\pagesname}{Pages}%
\newcommand{\urlname}{URL}% 
\newcommand{\ftpname}{FTP}%

% Define Illustrations environment
\usepackage{newfloat}
\DeclareFloatingEnvironment[
    fileext=loi,
    name=Illustration,
    placement=tbhp,
    within=chapter,
]{illustration}
    \addto\captionsenglish{
      \renewcommand\listillustrationname{List of Illustrations}
      }
      
	\ifmodernoption
		% More Names
		\translator{\@ThesisType} 
		\institution{\@UniversityName}
		\department{\@SchoolName}
		\division{\@DepartmentName}
		\other{Address}	
	\else
		% More Names
		\translator{\@ThesisType}
		\institution{\@UniversityName}
		\department{\@SchoolName}
		\division{\@DepartmentName}
		\other{Address}	
	\fi
    \ifprinteroption
    	\edef\@chaptercolor{gray}
        \edef\@appendixcolor{gray!80}
        \edef\titlepageshadecolor{white}
        \edef\colouredtextcolor{black}
        \edef\logoshadecolor{white}
        \edef\@thesisurlcolor{black}
        \edef\@thesistitlecolor{black}
        \edef\@frontpagetitlefillcolor{white}
    \else
    	% do nothing
    \fi
	\ifmodernoption
	 	 \usepackage{amsmath,amsthm,amssymb,kmath,kerkis}
         	\usepackage[scaled=.75]{beramono}% scale tt font (url etc.)
	\else
		\usepackage{amsmath}
		\usepackage{amsthm}
		\usepackage{amssymb}
	\fi
	% Index generation
	\ifnoindexoption
		\newcommand\printindices{}
    	\newcommand*{\indexEN}[1]{}%
    	\newcommand*{\indexGR}[1]{}%    
   	 	\message{LaTeX Warning: (teipel-thesis-en.cls): The "noindex" option has %
   		 been selected. Index generation has been disabled. To allow index generation, %
    	 please remove the "noindex" option.}%
		\typeout{ }%
	\else
		\usepackage{imakeidx}
		\makeindex[name=greek,title=Index of Greek Terms,%
			intoc, columnseprule]
		\makeindex[name=english,title=Index,%
			intoc, columnseprule]
		\let\oldindex\index
		\renewcommand*{\index}[1]{\oldindex[english]{#1}}%
		\newcommand\printindices{%
    		\pagestyle{indexpage}
			\printindex[english] 
    		\renewcommand\indexname{Index}
    		\pagestyle{indexpage}    
    		\ifodd\value{page}
    			\clearpage
        		\pagestyle{empty}
    		\else
    		\fi
		}
	\fi    
	\ifhyperrefoption
	 	\usepackage[unicode]{hyperref}
		\usepackage{bookmark}
        \bookmarksetup{startatroot}
	\else
	\fi
    \newcommand\setpdfproperties{%
		\ifhyperrefoption
        	\hypersetup%
			{colorlinks=true, linkcolor=\@thesisurlcolor,%
            urlcolor=\@thesisurlcolor,pdfencoding=auto, %
            citecolor=\@thesisurlcolor,pdfauthor={\@author},%
            pdftitle={\@title}, %
        	pdfcreator={teipel-thesis-en pdfLaTeX class (version \fileversion) %
            by John Liaperdos}}
        	\usepackage[all]{hypcap}
		\else
        	%% The following macros remain in the auxiliary files even when
            %% hyperref is disabled, causing "undefined control sequence" errors.
            %% Fixed by adding their dummy definitions.
			\newcommand\hyperindexformat[1]{}%
			\newcommand\hyperpage[1]{}%
		\fi    
    }
    \ifwatermarkoption
        \ifplainoption
        \else
	 	 	\usepackage{background}
         	\backgroundsetup{%
         	contents={\@draftIndication},%
         	angle=90, vshift=2.6cm,%
         	scale=3.4, color=gray}
        \fi
	\else
		% do nothing
	\fi	
%

\uppertitleback{
    \begin{minipage}{2cm}
        	\scalebox{\@LogoScaleFactor}{\includegraphics[width=2cm]{\logopath}}
    \end{minipage}
    \hspace{0.5cm}
    \begin{minipage}{12cm}
	    \ifmodernoption
		 	  \textsc{\@institution} \\
		      \textsc{\@department} \\
		      \textsc{\@division} 
		\else
		        \@institution \\
		        \@department \\
		        \@division 
		\fi		
    \end{minipage}
}

\approval{%
    \@approvalStatement~\@examinationDate.\\[11pt]%
    \begin{tabular}{ccc}	
     	\textit{(Signature)} &   \textit{(Signature)} &  \textit{(Signature)} \\[1.5cm]%
        \dotfill & \dotfill & \dotfill \\
     	~\@supervisor~ &  ~\@firstExaminer~ & ~\@secondExaminer~ \\
 		~\@supervisorTitle~ &  ~\@firstExaminerTitle~ & ~\@secondExaminerTitle~ 
    \end{tabular}
}

\newcommand\signature{%
	\ifx\singleauthor\@empty
		(Signatures)
	\else
		(Signature)
    \fi
}

\newcommand*{\extractname}[2]{%
  \StrBetween[{#1},{\numexpr(#1)+1\relax}]{,#2,}{,}{,}%
}

\newcommand\signaturestable{%
    \StrCount{\@authorName,}{,}[\totalauthors]
    \DIVIDE{0.85}{\totalauthors}{\tablecolumnwidthfactor}
    \MIN{\tablecolumnwidthfactor}{0.3}{\tablecolumnwidthfactor}
    	\ifx\@authorNameEN\@empty%
		\else%
    		\foreach \n in {1,...,\totalauthors}{%
    			\parbox[t]{\tablecolumnwidthfactor\textwidth}%
                {\begin{spacing}{1} \raggedright\dotfill%
                \\\begin{hyphenrules}{nohyphenation}%
                \extractname{\n}%
                {\@authorName}\end{hyphenrules}%
                \end{spacing}}~~
                \ifx\n\totalauthors\else\hfill\fi 
        	}
		\fi%
} 

\middletitleback{%
    \vspace{3cm} 
    \textcolor{\colouredtextcolor}{Copyright \copyright } -- All rights reserved.  %
	\ifx\@authorNameEN\@empty
	\else
        \@authorName,
	\fi 
    \@copyrightYear. 
    \\[12pt]
	\input{copyright_statement}%
    \\[24pt]
    \textit{\signature} 
    \\[44pt]
    \signaturestable
}


% Redefining Commands
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse \pagenumbering{roman}
}
\renewcommand{\mainmatter}{
    \label{lastfront}
    \cleardoublepage
    \@mainmattertrue\pagenumbering{arabic}
    \addtocontents{toc}{\protect\addvspace{1em}}
}
\renewcommand{\backmatter}{
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
}
% Headings
\def\invisiblethingie{\tiny\ }
\def\myemptypage{
    \mbox{}
    \vspace{\fill}
    \begin{flushright}
        \invisiblethingie
    \end{flushright}
    \vspace{5ex}
    \thispagestyle{empty}
}
%
\renewcommand{\cleardoublepage}{
    \clearpage %
    \if@twoside \ifodd\c@page\else
    \myemptypage
    \newpage
    \if@twocolumn\mbox{}\newpage\fi\fi\fi
}
%
\renewcommand{\chaptermark}[1]{
    \markboth{\mbox{\@chapapp}\ \thechapter.\ \ #1}{}%
}
\renewcommand{\sectionmark}[1]{
    \markright{\thesection\ \ #1}{}
}
%
\fancyhf{}
\ifplainoption
	\ifwatermarkoption
    	\fancyfoot[RO]{%
        	\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}
        }
    	\fancyfoot[LO]{%
        	\textcolor{\@chaptercolor}%
            {\textit{\@draftIndication}}%
        } 
    	\fancyfoot[LE]{%
        	\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}
        }
    	\fancyfoot[RE]{%
        	\textcolor{\@chaptercolor}%
            {\textit{\@draftIndication}}%
        }       
    \else
    	\fancyfoot[LE,RO]{%
    		\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}%
        }
    \fi
\else
	\fancyfoot[LE,RO]{%
	\tikz\node[fill=\@chaptercolor] (0,0){\color{white}\textbf{\thepage}};%
    }
\fi       	

\fancyhead[RO]{\footnotesize{{\color{\@chaptercolor}\rightmark}}}
\fancyhead[LE]{\footnotesize{{\color{\@chaptercolor}\leftmark}}}
\addtolength{\headheight}{2pt}
\setlength{\headwidth}{\textwidth}
\addtolength{\topmargin}{-2pt}
\fancypagestyle{plain}{ %
  \fancyhf{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  \ifplainoption
	\ifwatermarkoption
    	\fancyfoot[RO]{%
        	\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}
        }
    	\fancyfoot[LO]{%
        	\textcolor{\@chaptercolor}%
            {\textit{\@draftIndication}}%
        } 
    	\fancyfoot[LE]{%
        	\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}
        }
    	\fancyfoot[RE]{%
        	\textcolor{\@chaptercolor}%
            {\textit{\@draftIndication}}%
        }
    \else
    	\fancyfoot[LE,RO]{%
    		\colorbox{\@chaptercolor}{\color{white}\textbf{\thepage}}%
        }
    \fi  
  \else
  	\fancyfoot[RO]{\tikz\node[fill=\@chaptercolor] (0,0)%
    {\color{white}\textbf{\thepage}};}
  \fi
  }
\fancypagestyle{indexpage}{ %
  \fancyfoot[RO]{\tikz\node[fill=\@chaptercolor] (0,0){\color{white}\textbf{\thepage}};}
  \fancyhead[RO]{\footnotesize{{\color{\@chaptercolor}\indexname}}}
  \fancyhead[LE]{\footnotesize{{\color{\@chaptercolor}\indexname}}}
  }
%
% More Enviroments
\newenvironment{keywords}{\section*{\color{\colouredtextcolor}\keywordsname}}{}
\newcommand{\footacknowledgement}[1]{%
  \let\@tmp@makefntext\@makefntext%
  \long\def\@makefntext##1{%
      \parindent 1em%
      \noindent##1}%
  \footnotetext{#1}%
  \let\@makefntext\@tmp@makefntext% 
}
\newcommand\acksignatures{%
	\vspace{15pt}%
    \StrCount{\@authorName,}{,}[\totalauthors]
    	\ifx\@authorName\@empty%
        \else
    		\begin{flushright}
        		\begin{varwidth}[t]{\textwidth}%
            		\centering%
                	\ifx\@ackPlaceDate\@empty%
    				\else%
    					\@ackPlaceDate\\[10pt]%
    				\fi% 
        			\foreach \n in {1,...,\totalauthors}{%
            			\textit{\extractname{\n}%
               			{\@authorName}}\\%
          			}%
      			\end{varwidth}
        	\end{flushright}                    
        \fi    
}
\newenvironment{acknowledgements}{%
  \chapter*{\acknowledgementsname\@mkboth{\acknowledgementsname}{\acknowledgementsname}}%
  \ifplainoption\else\phantomsection\fi%
  \addcontentsline{toc}{chapter}{\acknowledgementsname}%
}{\acksignatures}
\newenvironment{acknowledgements*}{%
  \chapter*{\acknowledgementsname\@mkboth{\acknowledgementsname}{\acknowledgementsname}}%
  \ifplainoption\else\phantomsection\fi%
  \addcontentsline{toc}{chapter}{\acknowledgementsname}%
}{}
\newenvironment{preface}{%
  \chapter*{\prefacename}\@mkboth{\prefacename}{\prefacename}%
  \ifplainoption\else\phantomsection\fi%
  \addcontentsline{toc}{chapter}{Preface}%
}{}
\def\abstract{%
  \chapter*{\abstractname\@mkboth{\abstractname}{\abstractname}}
  \ifplainoption\else\phantomsection\fi%
  \addcontentsline{toc}{chapter}{Abstract}
}
\def\endabstract{\par\vfil\null\endtitlepage}
%

% Misc

\AtEndDocument{\subparagraph{}\label{lastback}}
\let\oldbibliography\bibliography
\renewcommand\bibliography[1]{%
	\cleardoublepage%
    \ifhyperrefoption%
        \bookmarksetup{startatroot}%
	\else%
		% do nothing
	\fi%
	\oldbibliography{#1}%
    	\addtocontents{toc}{\bigskip}%
	\addcontentsline{toc}{chapter}{Bibliography}%
	\ifodd\value{page}
    		\clearpage
        	\pagestyle{empty}
    	\else
    	\fi
}

%% Dedication
\newcommand{\thesisDedication}[1]{%
	\cleardoublepage
	\thispagestyle{empty}
    ~\\
    \vfill
    \begin{flushright}
    	\textit{#1}
    \end{flushright}
    ~\\
    \vfill
    \pagebreak
}

%% Algorithm support
	% reset algorithm counter at every chapter
		\@addtoreset{algorithm}{chapter}
	% Algorithm environment
		\usepackage{algorithm}
        \usepackage[algo2e]{algorithm2e} 
        
		% enable floating algorithms
			\usepackage{float}
			\floatname{algorithm}{\begingroup\small\textcolor{\colouredtextcolor}{\textsc{Algorithm}}\endgroup}
		\renewcommand{\thealgorithm}{\begingroup\small\textcolor{\colouredtextcolor}%
			{\thechapter.\arabic{algorithm}}\endgroup}

% color horizontal lines in algorithm environment
	\newcommand\fs@coloruled{\def\@fs@cfont{}\let\@fs@capt\floatc@ruled
	  \def\@fs@pre{{\color{white}\hrule height.8pt depth0pt }\kern2pt}%
	  \def\@fs@post{\vspace{-10pt}\kern2pt{\color{\colouredtextcolor}\rule{\textwidth}{1pt}\color{black}}\relax}%
	  \def\@fs@mid{\kern2pt{\color{\colouredtextcolor}\rule{\textwidth}{1pt}\color{black}\vspace{5pt}}\kern2pt}%
	  \let\@fs@iftopcapt\iftrue}
	% apply colored horizontal lines to algorithms
		\floatstyle{coloruled}
		\restylefloat{algorithm}


%% CD covers and labels

\usepackage{tikz} % allows drawing shapes
\ifplainoption
	\newcommand{\definecdlabeloffsets}[4]{}
    \newcommand{\createcdlabel}[5]{%
    	\message{LaTeX Warning: (teipel-thesis-en.cls): The "plain" option has %
    	been selected. CD label generation has been disabled.}%
		\typeout{ }%
    }
    \newcommand{\createcdcover}[5]{%
    	\message{LaTeX Warning: (teipel-thesis-en.cls): The "plain" option has %
    	been selected. CD cover generation has been disabled.}%
		\typeout{ }%
    }
\else
	\usetikzlibrary{decorations.text}
	\usepgflibrary{shapes}

	\newcommand{\definecdlabeloffsets}[4]{
		\edef\upperlabelxoffset{#1}
		\edef\upperlabelyoffset{#2}
		\edef\lowerlabelxoffset{#3}
		\edef\lowerlabelyoffset{#4}
	}

	\newcommand{\createcdlabel}[5]{
		\cleardoublepage
		\pagestyle{empty}    
		% Zero page margins
			\setlength{\oddsidemargin}{0mm}
			\setlength{\evensidemargin}{0mm}
			\setlength{\textwidth}{\paperwidth}	
			\setlength{\topmargin}{0mm}
			\setlength{\textheight}{\paperheight}
		\fontsize{7}{8.4}\selectfont
		\ifletteroption%
			\edef\cdlabelnodeshift{1cm}%	
		\else%
			\edef\cdlabelnodeshift{0cm}%
		\fi%			
		\begin{tikzpicture}[remember picture, overlay]
	    	\ADD{-10.5}{\upperlabelxoffset}{\x} \ADD{-7.4}{\upperlabelyoffset}{\y}
	    	\node [shift={(\x cm,\y cm)}]  at %
            (current page.north east) % slightly change y value for finer adjustment
	        {%
	        \begin{tikzpicture}[remember picture, overlay, yshift=\cdlabelnodeshift]
	            \draw(0,0) % circle's center (relative)
					circle (2cm) % circle #1 radius
					circle (5.6cm);
                \node[draw=none, align=center] at (-3.5,1.2) %
                	{\scalebox{\@LogoScaleFactor}{\includegraphics[width=1.5cm]{\logopath}}};
                \node[draw=none, text width=3.3cm, align=center] at (-3.7,-0.5)%
                {\textbf{#2}};%
             	\node[draw=none, align=center] at (3.5,-0.5) %
                {\textbf{\@ThesisType} \\[5pt] %
                	\@UniversityLocation,  \\ #3 \\ #4};%
				\node[draw=none,text width=#5cm, align=center] at (0,3)%
                	{\fontsize{9}{10.8}\selectfont \textbf{#1} \fontsize{7}%
                    {8.4}\selectfont};   
	            \path [decorate,decoration={raise=-1ex, text along path, reverse path, %
                text align={center}, text={\@UniversityName - \@SchoolName %
                - \@DepartmentName}}] (4.7cm,-2.8cm) %
                arc (-30:210:5.45cm) ;
	        \end{tikzpicture}
	        };
	     	\ADD{-13.5}{\upperlabelxoffset}{\xx} \ADD{-12}{\upperlabelyoffset}{\yy}
	     	\node [shift={(\xx cm,\yy cm)}]  at %
            (current page.north east) % slightly change y value for finer adjustment
	        {%
	        \begin{tikzpicture}[remember picture, overlay, yshift=\cdlabelnodeshift]
	             \draw(0,0) % rectangle's center (relative)
				  	rectangle (6cm,2.5cm);
           		 \node[draw=none] at (3,1.25) {\textit{barcode label}};      
	        \end{tikzpicture}
	        };		
		\end{tikzpicture}

		%% lower copy:
		\fontsize{7}{8.4}\selectfont
		\begin{tikzpicture}[remember picture, overlay, yshift=\cdlabelnodeshift]%
	    	\ADD{-10.5}{\lowerlabelxoffset}{\xxx} \ADD{-22.2}{\lowerlabelyoffset}{\yyy}
	    	\node [shift={(\xxx cm,\yyy cm)}]  at %
            (current page.north east) % slightly change y value for finer adjustment
	        {%
	        \begin{tikzpicture}[remember picture, overlay, yshift=\cdlabelnodeshift]
	            \draw(0,0) % circle's center (relative)
					circle (2cm) % circle #1 radius
					circle (5.6cm);%
                \node[draw=none, align=center] at (-3.5,1.2)%
                	{\scalebox{\@LogoScaleFactor}{\includegraphics[width=1.5cm]{\logopath}}};
                \node[draw=none, align=center] at (3.5,-0.5) {\textbf{PhD}  %
                	\\ \textbf{Thesis}  \\[5pt] \@UniversityLocation,  \\ #3 \\ #4};%
               	\node[draw=none, text width=3.3cm, align=center] at (-3.7,-0.5)%
                	{\textbf{#2}};
				\node[draw=none,text width=#5cm, align=center] at (0,3) %
                	{\fontsize{9}{10.8}\selectfont \textbf{#1} \fontsize{7}%
                    	{8.4}\selectfont};   
	          	\path [decorate,decoration={raise=-1ex, text along path, %
                    reverse path, text align={center}, text={\@UniversityName -  \@SchoolName %
                     - \@DepartmentName}}]%
                    (4.7cm,-2.8cm) arc (-30:210:5.45cm);%
	        \end{tikzpicture}
	      };
	     \ADD{-13.5}{\lowerlabelxoffset}{\xxxx} \ADD{-26.8}{\lowerlabelyoffset}{\yyyy}
	     \node [shift={(\xxxx cm,\yyyy cm)}]  at %
         	(current page.north east) % slightly change y value for finer adjustment
	        {%
	     		\begin{tikzpicture}[remember picture, overlay, yshift=\cdlabelnodeshift]
	     			\draw(0,0) % rectangle's center (relative)
						rectangle (6cm,2.5cm);%
           			\node[draw=none] at (3,1.25) {\textit{barcode label}};%
	     		\end{tikzpicture}
	     	};		
		\end{tikzpicture}
		%
		\pagebreak
	}

	\newcommand{\createcdcover}[5]{
		\cleardoublepage
		\pagestyle{empty}
		% Zero page margins
			\setlength{\oddsidemargin}{0mm}
			\setlength{\evensidemargin}{0mm}
			\setlength{\textwidth}{\paperwidth}	
			\setlength{\topmargin}{0mm}
			\setlength{\textheight}{\paperheight}
		\fontsize{9}{10.8}\selectfont 
		\ifletteroption%
			\edef\uppercdcovernodeshift{(-10.5cm,-7.4cm)}%
			\edef\lowercdcovernodeshift{(-10.5cm,-20.9cm)}%		
		\else%
			\edef\uppercdcovernodeshift{(-10.5cm,-8.4cm)}%
			\edef\lowercdcovernodeshift{(-10.5cm,-21.9cm)}%
		\fi%		
		\begin{tikzpicture}[remember picture, overlay]%
	    	\node [shift={\expandafter\uppercdcovernodeshift}]  at %
            	(current page.north east)% slightly change y value for finer adjustment
	        	{%
	        		\begin{tikzpicture}[remember picture, overlay]
						\draw[thick] (-5.8,-5.8) rectangle (5.8,5.8); 
						\draw[dashed] (-6,-6) rectangle (6,6); 
						\node at (-4.6,4.4){\scalebox{\@LogoScaleFactor}{\includegraphics[width=1.8cm]%
                        	{\logopath}}};
                   		\node[draw=none, text width=9cm, align=left] at (1,4.3) %
                        	{\@UniversityName \\ \@SchoolName. \\ %
                            \@DepartmentName};%
                   		\node[draw=none, text width=9cm, align=center] at (0,2.3) %
                        	{\@ThesisType};%
						\node[draw=none,text width=#5cm, align=center] at (0,0)%
                        	{\fontsize{11}{13.2}\selectfont \textbf{#1} %
                            \fontsize{8}{9.6}\selectfont};%   
                   		\node[draw=none, text width=7cm, align=center] at (0,-2.5)%
                        	{\textbf{#2}};
                   		\node[draw=none, text width=10cm, align=center] at (0,-4)%
                        	{\scalebox{0.7}{\@UniversityLocation}};
                   		\node[draw=none, text width=5cm, align=center] at (0,-4.5)%
                        	{\scalebox{0.7}{#3 #4}};
	        		\end{tikzpicture}
	        	};	
		\end{tikzpicture}

		%% lower copy:
		\fontsize{9}{10.8}\selectfont 
		\begin{tikzpicture}[remember picture, overlay]
	    	\node [shift={\expandafter\lowercdcovernodeshift}]  at %
            	(current page.north east) % slightly change y value for finer adjustment
	        	{%
	        		\begin{tikzpicture}[remember picture, overlay]%
						\draw[thick] (-5.8,-5.8) rectangle (5.8,5.8);% 
						\draw[dashed] (-6,-6) rectangle (6,6);%
						\node at (-4.6,4.4){\scalebox{\@LogoScaleFactor}{\includegraphics[width=1.8cm]%
                        	{\logopath}}};
                   		\node[draw=none, text width=9cm, align=left] at (1,4.3) %
                        	{\@UniversityName \\ \@SchoolName \\ %
                            \@DepartmentName};%
                   		\node[draw=none, text width=9cm, align=center] at (0,2.3) %
                        	{\@ThesisType};%
						\node[draw=none,text width=#5cm, align=center] at (0,0)%
                        	{\fontsize{11}{13.2}\selectfont \textbf{#1} \fontsize{8}%
                            {9.6}\selectfont};   
                   		\node[draw=none, text width=7cm, align=center] at (0,-2.5)%
                        	{\textbf{#2}};
                   		\node[draw=none, text width=10cm, align=center] at (0,-4)%
                        	{\scalebox{0.7}{\@UniversityLocation}};%
                   		\node[draw=none, text width=5cm, align=center] at (0,-4.5)%
                        	{\scalebox{0.7}{#3 #4}};
	        	\end{tikzpicture}
	        };	
		\end{tikzpicture}
	%
	}
\fi

\usepackage{calc}

% Format Chapter Headers
	\usepackage[explicit]{titlesec}
	\usepackage{setspace}
	\ifmodernoption
	 	 \newcommand\titlefontsize{\LARGE}
         \newcommand\parttitlefontsize{\huge}
         \newcommand\chapternumberfontsize{\Huge}
	\else
		\newcommand\titlefontsize{\Large}
        \newcommand\parttitlefontsize{\Large}
        \newcommand\chapternumberfontsize{\huge}
	\fi	
	\newcommand*\chapterlabel{}
    \ifplainoption
    	\titleformat
			{\chapter} % command
			[display] % shape
			{\bfseries\color{\titlefillcolor}} % format
			{\Large{\chaptertitlename} \hspace{3pt}%
            		\colorbox{\titlefillcolor}{%
            		\chapternumberfontsize{\textcolor{white}{\thechapter}}}% 
                \\[12pt]
                \huge \textscale{\chapterTitleScaleFactor}{#1}
     		} % label 
			{0pt} % sep
			{
    			\vspace{-10pt}
                \rule{\textwidth}{1pt}
			} % before-code
			[
				%nothing
			] % after-code
    	\titleformat
			{name=\chapter,numberless} % command
			[display] % shape
			{\bfseries\color{\titlefillcolor}} % format
			{
                \huge \textscale{\chapterTitleScaleFactor}{#1}
			} % label 
			{0pt} % sep
			{
    			\vspace{-10pt}
                \rule{\textwidth}{1pt}
			} % before-code
			[
				%nothing
			] % after-code 
		\titlespacing{\chapter}{0pt}{35pt}{20pt}% 
		\titlespacing{name=\chapter,numberless}{0pt}{35pt}{10pt}% 
    \else       
		\titleformat{\chapter}[block]
	  		{\gdef\chapterlabel{}\normalfont\sffamily\Huge\bfseries\scshape}
	  		{\gdef\chapterlabel{\small\chaptertitlename\huge %
            	~\thechapter{:} }}{0pt}
	  		{%
        		\titlefontsize \textcolor{white}{#1}%
        		\begin{tikzpicture}[remember picture,overlay]
	    			\node[align=left,yshift=-2.4cm] at (current page.north west)
	      			{
	      				\begin{tikzpicture}[remember picture, overlay]
	        				\draw[fill=\titlepageshadecolor] (0,0) rectangle %
                            	(\paperwidth + 10pt,3cm);
	        				\node[anchor=north west, align=left, %
                            	xshift=0.5*(\paperwidth - \textwidth),yshift=0.6cm,%
                                rectangle, rounded corners=15pt,inner sep=11pt,%
                                fill=\titlefillcolor]% 
	              				{\Large\color{white}\chapterlabel%
                                	\begin{varwidth}[t]%
                                    	{\textwidth - \widthof{\chapterlabel}}%
	              						{\raggedright%
                                        \begin{spacing}{1} %
                                        	\titlefontsize {#1}%
                                        \end{spacing}}%
                                        \end{varwidth}%
                                };
	       				\end{tikzpicture}
	      			};
	   			\end{tikzpicture}%     
	  		}%
    	\titlespacing{\chapter}{0pt}{-35pt}{20pt}%  
   \fi   
    
% Format Part Headers
	\newif\iftypesetappendices%
    \typesetappendicesfalse%
	\newcommand*\partlabel{}
    \ifplainoption
    	\titleformat
			{\part} % command
			[display] % shape
			{\bfseries\color{\titlefillcolor}} % format
			{\phantomsection\huge{\partname} \hspace{3pt}%
            	\colorbox{\titlefillcolor}{%
            	\chapternumberfontsize{\textcolor{white}{\thepart}}}%                
                \\[12pt]
                \Huge \textscale{\chapterTitleScaleFactor}{#1}%
     		} % label 
			{0pt} % sep
			{
    			\vspace{-10pt}
                \rule{\textwidth}{1pt}
			} % before-code
			[
				%nothing
			] % after-code
    	\titleformat
			{name=\part,numberless} % command
			[display] % shape
			{\bfseries\color{\titlefillcolor}} % format
			{
                \phantomsection\Huge #1
			} % label 
			{0pt} % sep
			{
    			\vspace{-10pt}
                \rule{\textwidth}{1pt}
			} % before-code
			[
				%nothing
			] % after-code  
    \else    
		\titleformat{\part}
	  		{\gdef\partlabel{}\normalfont\sffamily\Huge\bfseries\scshape}
	  		{\gdef\partlabel{\thispagestyle{empty}\Huge\thepart}}{0pt}
	  		{%
      			\phantomsection%
      			\begin{tikzpicture}[remember picture,overlay]
	    			\node[align=center,yshift=3cm] at (current page.west)
	      			{%
          				\iftypesetappendices%
            				\thispagestyle{empty}%
       						\edef\partboxcolor{\@appendixcolor}%
						\else%
							\edef\partboxcolor{\titlefillcolor}%
						\fi%
	      				\begin{tikzpicture}[remember picture, overlay]
            				\iftypesetappendices%
       							\draw[fill=\titlepageshadecolor] (0,0) rectangle%
                               		(\paperwidth + 10pt,3cm);
	        					\node[xshift=0.5*\paperwidth,align=center,rectangle,%
	              					rounded corners=15pt,inner sep=17pt,%
	              					fill=\partboxcolor] 
	              					{%
       									\parttitlefontsize \textcolor{white}{#1}%		
                  					};
							\else%
	        					\draw[fill=\titlepageshadecolor] (0,0) rectangle%
	          						(\paperwidth + 10pt,3cm);
	        					\node[xshift=0.5*\paperwidth, yshift=3cm, align=center,%
                                	circle, fill=\partboxcolor, inner sep=10pt, %
                                    minimum width=1.5cm, draw=black] %
	              					{%
										\Huge\color{white}\partlabel%
                  					};
	        					\node[xshift=0.5*\paperwidth, yshift=1cm, align=center,%
                                	anchor=north, rectangle, rounded corners=15pt,%
                                    inner sep=17pt, fill=\partboxcolor]% 
	              					{%
										\begin{varwidth}{\textwidth}%
                                        	\parttitlefontsize%
                                        	\textcolor{white}{#1}%
                    	            	\end{varwidth}%
                  					};
							\fi%
	       				\end{tikzpicture}
	      			};
	   			\end{tikzpicture}
	  	}%
	\fi

% Format Appendices
	\newcommand\appendices{%
    	\typesetappendicestrue%
    	\ifhyperrefoption%
        	\bookmarksetup{startatroot}%
		\else%
			% do nothing
		\fi%
	\edef\colouredtextcolor{\appendixcolouredtextcolor}%
    \part*{Appendices} %
    \ifplainoption\else\phantomsection\fi%
    \appendix%
    \edef\titlefillcolor{\@appendixcolor}%
		\ifmodernoption%
	 	 	\renewcommand\titlefontsize{\Large}%
		\else%
			\renewcommand\titlefontsize{\normalsize}%
		\fi%
    \typesetappendicesfalse%
	}

% Define Custom Colors
\definecolor{teipel_red}{RGB}{190,65,65}
\definecolor{lightgray}{RGB}{233,233,233}


\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{indentfirst}
\usepackage{verbatim}
\usepackage{latexsym}
\bibliographystyle{IEEEtran}
\usepackage{hyphenat}

% Name Definitions
\newtheorem{definition}{Definition}
\newtheorem{proposition}{Proposition}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{lemma}{Lemma}
\newtheorem{example}{Example}
\newtheorem{remark}{Remark}
\newtheorem{notation}{Notation}
\newtheorem{law}{Law}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theproposition}{\arabic{chapter}.\arabic{proposition}}
\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\To}{\Longrightarrow}

% Change figure, table and illustration caption colors 
\usepackage{caption}
\captionsetup[figure]{labelfont={color=\colouredtextcolor},textfont={it}}
\captionsetup[table]{labelfont={color=\colouredtextcolor},textfont={it}}
\captionsetup[illustration]{labelfont={color=\colouredtextcolor},textfont={it}}

% Macros for list of abbreviations
\newcommand{\abbrev}[2]{#1 \> #2\\ }
\newcommand\includeabbreviations[1]{%
	\chapter*{Abbreviations}%
	\addcontentsline{toc}{chapter}{Abbreviations}%
	\markboth{Abbreviations}{Abbreviations}%
    \input{#1}%
    \cleardoublepage\pagestyle{empty}%
}

% Macros for glossary
\newcommand{\gloss}[2]{\textbf{#1} \> #2\\ }
\newcommand\includeglossary[1]{%
	\chapter*{Glossary}%
	\addcontentsline{toc}{chapter}{Glossary}%
    \markboth{Glossary}{Glossary}%
    \input{#1}%
    \ifx\printindices\@empty
    	\relax
    \else
    	\ifodd\value{page}
    		\clearpage
        	\pagestyle{empty}
    	\else
    	\fi    
    \fi
    %
}

% Redefine illustration environment
\newenvironment{Illustration}[1][]%
{%
	\begin{illustration}[#1] 
		\ifhyperrefoption%
	 	 	\capstart%
		\else%
			% do nothing
		\fi%

}%
{%
	\end{illustration}
}%

% Add some extra space between numbers and captions 
% in list of figures/tables/illustrations
\makeatletter
     \renewcommand*\l@figure{\@dottedtocline{1}{1em}{3.2em}}
     \renewcommand*\l@table{\@dottedtocline{1}{1em}{3.2em}}
     \renewcommand*\l@illustration{\@dottedtocline{1}{1em}{3.2em}}
\makeatother

% Handle front- main- matter
\newcommand\beginfrontmatter{%
	\ifhyperrefoption
		\mainmatter
	\else
		\frontmatter
	\fi
}
\newcommand\beginmainmatter{%
	\ifhyperrefoption
		% do nothing
	\else
		\mainmatter
	\fi
	\ifminitocoption
		\setcounter{mtc}{3}
	\fi	
}

% Historiated initial option
\newcommand\InitialCharacter{}
\ifhistinitoption
	\usepackage{lettrine}
    \ifmodernoption
    	\renewcommand\InitialCharacter[1]{%
    		\lettrine[lines=2,findent=3pt]%
			{\color{\colouredtextcolor}\scalebox{1.3}%
			{#1}}{}% 
		}
    \else
    	\renewcommand\InitialCharacter[1]{%
    		\lettrine[lines=2]%
			{\color{\colouredtextcolor}\scalebox{1.0}%
			{\textbf{#1}}}{}%
		}
    \fi
\else
    \renewcommand\InitialCharacter[1]{#1}
\fi


%  set line spacing 
\renewcommand{\baselinestretch}{1.2}

% typeset source code
\newcommand{\src}[1]{{\tt#1}}

% typeset a backslash
\newcommand{\bkslash}{\symbol{92}}

% Execute some code before and after \begin{document} 
	\usepackage{etoolbox}
    \AtEndPreamble{\preprocess\compileauthors\setpdfproperties}%
    \AtBeginDocument{\dominitoc}
%

% Enable typesetting individual table of content per chapter, using the minitoc package
\ifminitocoption
	\usepackage{minitoc}
\else
	\newcommand{\dominitoc}{\relax}
	\newcommand{\minitoc}{\relax}
\fi

%
\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHANGE-LOG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% ---------------------------------------------
%% 19/02/2018 - version 1.3:
%% ---------------------------------------------
%% 1. Fixed correct location not printing on CD Labels. 
%%
%% ---------------------------------------------
%% 31/03/2017 - version 1.2:
%% ---------------------------------------------
%% 1. Added support for typesetting table of contents per chapter using the minitoc package. 
%%
%% ---------------------------------------------
%% 14/01/2017 - version 1.1:
%% ---------------------------------------------
%% 1. Added support for typesetting algorithms using the algorithm2e package. 
%%
%% ---------------------------------------------
%% 05/02/2015 - version 1.0:
%% ---------------------------------------------
%% 1. This class is a generalization of the 'teipel-thesis' class. 
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%