\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{minimalist}

\LoadClass{ctexart}
\RequirePackage{tabularx}
\RequirePackage{enumitem}

\pagenumbering{gobble}

\newcommand{\horizontalline}{\par\noindent\rule{\textwidth}{0.4pt}}

\newcommand{\name}[2]{
    \begin{center}
    {\LARGE\it \bf #1} \\
    {#2}
    \end{center}
}

\newcommand{\header}[1]{
    \begin{flushleft}
    {\heiti \large #1}
    \end{flushleft}
}

\newcommand{\bareheader}[1]{
    \begin{flushleft}
    {\heiti \large #1}
    \end{flushleft}
}

\newcommand{\fillheader}[1]{
    \begin{flushleft}
    {\heiti \large #1}~\dotfill
    \end{flushleft}
}

\endinput