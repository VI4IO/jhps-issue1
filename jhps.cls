\ProvidesClass{jhps}[2020/07/06 v1]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,11pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor}
\usepackage[english]{babel}
\usepackage{geometry}
\newgeometry{left=3cm,bottom=2.5cm,right=2.5cm,top=2.5cm}
\usepackage{lastpage}

\usepackage[cmex10]{amsmath}
\usepackage{titling}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{cleveref}
\usepackage{fancyhdr}
\usepackage[table]{xcolor}
\usepackage{tikz}
\usepackage{floatrow}
\usepackage{colortbl}
\usepackage{listings}
\usepackage{chngcntr}
\usepackage{caption}
\usepackage{subcaption}
%%%% END packages

\newtoks\JHPSissue
\newtoks\JHPSkeywords

\bibliographystyle{alpha}

\graphicspath{ {./assets/} }

\date{\today}

\definecolor{JHPSRed}{HTML}{ee2d24}
\definecolor{tblhead}{HTML}{cccccc}
\definecolor{JHPSGray}{HTML}{cccccc}
\definecolor{Blue2}{HTML}{006d9a}
\definecolor{Green1}{HTML}{9ac013}
\definecolor{Green2}{HTML}{007000}

\hypersetup{
    colorlinks,
    linkcolor={JHPSRed},
    citecolor={JHPSRed},
    filecolor={JHPSRed},
    urlcolor={JHPSRed},
    anchorcolor={JHPSRed}
}

\renewcommand\UrlFont{\color{JHPSRed}}

\lstset{postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{blue}\hookrightarrow\space}},
  basicstyle=\fontsize{9}{8}\ttfamily,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  %commentstyle=\color{mygreen},    % comment style
  %deletekeywords={...},            % if you want to delete keywords from the given language
  %escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame={bt},	                     % adds a frame around the code frame={bt},
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\bf\ttfamily,       % keyword style
  %language=C,                     % the language of the code
  %morekeywords={*,...},           % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  xleftmargin=4ex,
  numbersep=2.5ex,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{darkgray}, % the style that is used for the line-numbers
  rulecolor=\color{JHPSRed},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  %stringstyle=\color{mymauve},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname%,
  %backgroundcolor=\color{JHPSGray}
}

\lstset{language=C++,
    keywordstyle=\color{Green2}\ttfamily,
    stringstyle=\color{JHPSRed}\ttfamily,
    commentstyle=\color{Blue2}\ttfamily,
    morecomment=[l][\color{magenta}]{\#}
}


\crefname{lstlisting}{listing}{listing}
\Crefname{lstlisting}{Listing}{Listing}

% Figure/Table placement
\def\fps@figure{!pb}
\def\fps@table{!pb}
\newfloat{lstfloat}{!pb}{lop}
\floatname{lstfloat}{Listing}
\def\lstfloatautorefname{Listing}

\setlength\headheight{18pt}


\renewcommand*{\maketitle}{
  \pagestyle{plain}
  \thispagestyle{title}

  \if\JHPSissue x
  \else
    This manuscript is in the JHPS incubator and has \textbf{not been assigned an issue} in the journal. Therefore, this header looks different. \\[0.2cm]

    \begin{minipage}{11cm}
    \tableofcontents
    \end{minipage}
  \fi

  \vskip 2em%
  \begin{center}%
    \begin{tikzpicture}
      \path [left color = JHPSRed!80, right color = JHPSRed!80]
        (0,0) rectangle (\hsize,0.25ex);
    \end{tikzpicture}
    {\huge \@title \par}%
    \begin{tikzpicture}
      \path [left color = JHPSRed!80, right color = JHPSRed!80]
        (0,0) rectangle (\hsize,0.25ex);
    \end{tikzpicture}
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%
}

\renewenvironment{abstract}{%
  \vspace*{-0.5cm}
    \small
    \null\vfil
    \begin{center}%
        {\bfseries \abstractname\vspace{-.5em}\vspace{0pt}}%
    \end{center}%
    \quotation
}
{\par \smallskip \textbf{Keywords}: \the\JHPSkeywords \endquotation\vfil\null \vspace*{-0.75cm}}

\newcommand{\fancyRulers}{
\renewcommand\footrule{\begin{minipage}{1\textwidth}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80]
      (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}
\end{minipage}\par}%
\renewcommand\headrule{
\vspace*{-0.5em}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80] (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}}%
}

\newcommand{\fancyFootRulers}{
\renewcommand\footrule{\begin{minipage}{1\textwidth}
  \begin{tikzpicture}
    \path [left color = JHPSGray!100, right color = JHPSRed!80]
      (0,0) rectangle (\hsize,0.25ex);
  \end{tikzpicture}
\end{minipage}\par}%
\renewcommand\headrule{}
}

% \makeatletter
% \global\let\tikz@ensure@dollar@catcode=\relax
% \makeatother

\fancypagestyle{plain}{
  \fancyRulers
  \fancyhead[L]{}
  \fancyhead[R]{\@date} %\leftmark
  \fancyhead[C]{\thetitle}
  \fancyfoot[C]{}
  \fancyfoot[R]{\thepage/\pageref*{LastPage}}
  \fancyfoot[L]{\includegraphics[height=0.8em]{jhps-logo} This article \if\JHPSissue appeared in the \href{https://jhps.vi4io.org/issue/\the\JHPSissue}{Journal of High-Performance Storage, \the\JHPSissue}\else is in the incubator of the \href{https://jhps.vi4io.org/incubator/}{Journal of High-Performance Storage}\fi }
}

\fancypagestyle{title}{
  \fancyFootRulers
  \fancyhead[L]{}
  \fancyhead[R]{} %\leftmark
  \fancyhead[C]{}
  \fancyfoot[C]{}
  \fancyfoot[R]{\thepage/\pageref*{LastPage}}
  \fancyfoot[L]{\includegraphics[height=0.8em]{jhps-logo} This article \if\JHPSissue appeared in the \href{https://jhps.vi4io.org/issue/\the\JHPSissue}{Journal of High-Performance Storage, \the\JHPSissue}\else is in the incubator of the \href{https://jhps.vi4io.org/incubator/}{Journal of High-Performance Storage}\fi }
}

\fancypagestyle{empty}{
  \fancyFootRulers
  \fancyhead[L]{}
  \fancyhead[R]{}
  \fancyfoot[C]{}
  \fancyfoot[R]{}
  \fancyfoot[L]{}
}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\rowcolors{2}{white}{lightgray!20!white}\oldtabular}{\endoldtabular}

\newcommand{\tab}{\hspace{9pt}}
\newcommand{\cellHeader}[0]{\cellcolor{JHPSRed}}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\endinput