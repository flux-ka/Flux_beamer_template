\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fluxbeamer}[2024-28-09 v0.1 FLUX beamer]

% define ifs
\newif\ifgerman

%% englisch und deutsch supporten
\DeclareOption{de}{
  \germantrue
  \PassOptionsToPackage{autostyle}{csquotes}
}

\DeclareOption{en}{
  \germanfalse
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
\setbeamersize{text margin left=7.3mm,text margin right=7.3mm}

% keine Navigationssymbole
\setbeamertemplate{navigation symbols}{}
\setbeamercovered{invisible}
\useinnertheme{rounded}
\beamer@compresstrue % Miniframes (Navigations-Punkte) für Subsections immer in einer Zeile, ohne Umbrüche

%%%%%%%%%%%% Footer %%%%%%%%%%%%%%
\setbeamertemplate{footline}{%
  \leavevmode%
  \begin{tikzpicture}[remember picture,overlay,shift=(current page.south west)] \begin{scope}[x={(current page.south east)},y={(current page.north west)}]
      \filldraw [flux-black, yshift=-10mm] plot [smooth cycle] coordinates {(-1, 0.2) (0.15, 0.3) (0.6, 0.15) (0.9, 0.2) (1.9, -0.5) (2, -0.5)};
    \end{scope}%
  \end{tikzpicture}%

  \leavevmode%
  \hbox{\begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm]{footlinecolor}%
      \includegraphics[width=25mm,height=25mm,keepaspectratio]{media/logo-flux-schwarz-transparnet.png}
    \end{beamercolorbox}}%
  \vskip0pt%
}



%%%%%%%%%%%%%%%% TITELSEITE %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\titleframe}{
  \begin{frame}[plain]
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