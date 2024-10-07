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

%%%%%%%%%%%% Farben %%%%%%%%%%%%%%%
\RequirePackage[dvipsnames]{xcolor}
\definecolor{flux-vio-dark}{HTML}{914a8f}
\definecolor{flux-vio-light}{HTML}{cfb9d1}
\definecolor{flux-blue-dark}{HTML}{404d99}
\definecolor{flux-blue-light}{HTML}{b3b7d2}
\definecolor{flux-green-dark}{HTML}{9cc442}



%%%%%%%%%%%%%%%% TITELSEITE %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\titleframe}{
  \begin{frame}[plain]
  \titlepage
  \end{frame}
}

\setbeamertemplate{title page}{

  \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
\begin{scope}[x={(current page.north east)},y={(current page.south west)}]
        \filldraw [flux-vio-dark] plot [smooth cycle] coordinates {(0, 0) (1, 0) (1, 0.2) (0, 0.2)};
\end{scope}
\end{tikzpicture}
}