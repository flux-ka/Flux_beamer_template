\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fluxbeamer}[2024-28-09 v0.1 FLUX beamer]

% define ifs
\newif\ifgerman
\newif\ifpagenum

%% englisch und deutsch supporten
\DeclareOption{de}{
  \germantrue
  \PassOptionsToPackage{autostyle}{csquotes}
}

\DeclareOption{en}{
  \germanfalse
}

\DeclareOption{pagenum}{
  \pagenumtrue
}

% von beamer deriven
\ExecuteOptions{de,16:9,navbarinline,bigfoot}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt,utf8]{beamer}

\ifgerman
  \RequirePackage[ngerman]{babel}
\fi

\RequirePackage{csquotes}
\RequirePackage{hyperref}
\RequirePackage[absolute,overlay]{textpos}

%%%%%%%%%%%% Farben %%%%%%%%%%%%%%%
\RequirePackage[dvipsnames]{xcolor}
\definecolor{flux-vio-dark}{HTML}{914a8f}
\definecolor{flux-vio-light}{HTML}{cfb9d1}
\definecolor{flux-blue-dark}{HTML}{404d99}
\definecolor{flux-blue-light}{HTML}{b3b7d2}
\definecolor{flux-green-dark}{HTML}{9cc442}
\definecolor{flux-green-light}{HTML}{dae7bb}
\definecolor{flux-yellow-dark}{HTML}{f7eb57}
\definecolor{flux-yellow-light}{HTML}{fbf7c6}
\definecolor{flux-orange-dark}{HTML}{f2ad40}
\definecolor{flux-orange-light}{HTML}{f6dfbb}
\definecolor{flux-red-dark}{HTML}{d93d45}
\definecolor{flux-red-light}{HTML}{e9b6b7}
\definecolor{flux-black}{HTML}{121212}
%freedomland
\definecolor{flux-gray}{HTML}{9a9a9a}
%fuckin Brits
\definecolor{flux-grey}{HTML}{9a9a9a}

% custom fonts
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

\setsansfont{ABeeZee}[
  Extension = .otf ,
  Path = fonts/ ,
  UprightFont = *-Regular ,
  ItalicFont = *-Italic ,
]

\newfontfamily\titlefont{YuseiMagic}[
  Extension = .ttf ,
  Path = fonts/ ,
  UprightFont = *-Regular ,
  ItalicFont = *-Regular
]

\setbeamerfont{title}{series=\bfseries,size=\Large,family=\titlefont}
\setbeamerfont{frametitle}{series=\bfseries,size=\Large,family=\titlefont}
\setbeamerfont{framesubtitle}{series=\bfseries,size=\normalsize}

\setbeamercolor{title}{fg=flux-black}
\setbeamercolor{frametitle}{fg=flux-black}

% Format
\RequirePackage{geometry}
\geometry{papersize={17.07cm,9.6cm}}

% Ränder außen
\newlength{\fluxleftmargin}
\setlength{\fluxleftmargin}{7.3mm}

\newlength{\fluxrightmargin}
\setlength{\fluxrightmargin}{8mm}
\setbeamersize{text margin left=\fluxleftmargin,text margin right=\fluxrightmargin, sidebar width right=\fluxrightmargin}

% keine Navigationssymbole
\setbeamertemplate{navigation symbols}{}
\setbeamercovered{invisible}
\useinnertheme{rounded}
\beamer@compresstrue % Miniframes (Navigations-Punkte) für Subsections immer in einer Zeile, ohne Umbrüche

%%%%%%%%%%%% Footer %%%%%%%%%%%%%%
\setbeamertemplate{footline}{%
  \leavevmode%
  \ifnum \theframenumber=0
  \else
    \begin{tikzpicture}[remember picture,overlay,shift=(current page.south west)] \begin{scope}[x={(current page.south east)},y={(current page.north west)}]
        \filldraw [flux-black, yshift=-10mm] plot [smooth cycle] coordinates {(-1, 0.2) (0.15, 0.3) (0.6, 0.15) (0.9, 0.2) (1.9, -0.5) (2, -0.5)};
      \end{scope}%
    \end{tikzpicture}%

    \hbox{%
      %% Flux Logo
      \begin{beamercolorbox}[wd=30mm,ht=20mm,dp=1mm, leftskip=3mm, rightskip=3mm]{footlinecolor}%
        \includegraphics[width=26mm,height=26mm,keepaspectratio]{media/logo-flux-schwarz-transparnet.png}
      \end{beamercolorbox}
      %%%% Page Number
      \ifpagenum%
        \begin{beamercolorbox}[wd=10mm,ht=0mm,dp=0mm,center]{pagenumbering in footer}%
          \usebeamerfont{pagenumbering in footer}%
          \begin{textblock*}{20mm}(126mm,\dimexpr\paperheight-8mm\relax)
            {\usebeamercolor[bg]{flux-gray} \large\strut\insertframenumber{}/\inserttotalframenumber}%
          \end{textblock*}%
        \end{beamercolorbox}%
      \fi%
    }%
    \vskip0pt%
  \fi
}

%%%%%%%%%%%%% Squiggle rechts %%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{sidebar canvas right}{%
  \ifnum \theframenumber=0\else
    \begin{tikzpicture}[remember picture,overlay,shift=(current page.south west)] \begin{scope}[x={(current page.south east)},y={(current page.north west)}]
        \draw [flux-black] plot [smooth cycle] coordinates {(0.97, 1.0) (0.95, 0.8) (1.2, 0.6) (0.97, 0.5) (1.0, 0.3) (0.98, 0.2) (0.98, 0.1) (0.97, 0.0) (1.0, 0.0) (1.0, 1.0)};
      \end{scope}
    \end{tikzpicture}
  \fi
}


%%%%%%%%%%%%%%%% TITELSEITE %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\titleframe}{
  \begin{frame}[plain, noframenumbering]
    \titlepage
  \end{frame}
}

\setbeamertemplate{title page}{

  % heading element
  \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
    \begin{scope}[x={(current page.north east)},y={(current page.south west)}]
      \filldraw [flux-red-light] plot [smooth cycle] coordinates {(-1, 0.82) (0.3, 0.12) (0.8, 0.32) (2, 0.02) (2, -0.12) (-1, -0.12)};
    \end{scope}
  \end{tikzpicture}

  % Black footer
  \begin{tikzpicture}[remember picture,overlay,shift=(current page.south west)] \begin{scope}[x={(current page.south east)},y={(current page.north west)}]
      \filldraw [flux-black] plot [smooth cycle] coordinates {(-1, 0.2) (0.15, 0.3) (0.6, 0.15) (0.9, 0.2) (1.9, -0.5) (2, -0.5)};
    \end{scope}
  \end{tikzpicture}

  % Logo
  \begin{textblock*}{45mm}(2mm,\dimexpr\paperheight-27mm\relax)
    \includegraphics[width=45mm,height=45mm,keepaspectratio]{media/logo-flux-schwarz-transparnet.png}
  \end{textblock*}

  % Title
  \begin{textblock*}{110mm}(7mm, 35mm)
    \usebeamerfont*{title}\fontsize{26}{24}\selectfont\inserttitle
  \end{textblock*}
}

%%%%%%%%%%%%%%% Folientitel %%%%%%%%%%%%%%%%%
\setbeamertemplate{frametitle}{
  \ifbeamer@plainframe\else%
    \begin{textblock*}{\dimexpr\paperwidth-30mm-2\fluxleftmargin}[0,1](\fluxleftmargin,\dimexpr\fluxleftmargin+\fluxrightmargin)%
      \usebeamerfont{frametitle}\insertframetitle%
    \end{textblock*}%
  \fi
  \vspace{18mm}
}

% correct itemization marks
\newcommand{\fluxmark}{%
  \begin{tikzpicture}
    \draw[fill=flux-gray, draw=none] (0,0) circle (3pt);
  \end{tikzpicture}
}

\setbeamertemplate{itemize items}{\raisebox{.2ex}{\fluxmark}}

% correct color for block titles
\setbeamerfont{block title}{size={\color{flux-blue-dark}}}


%%%% links %%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
  urlcolor=black,
  urlbordercolor=black,
  pdfborder={1 1 1},
  pdfborderstyle={/S/U/W 1}   
}