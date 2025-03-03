\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-classes/cs-classes}[2024/01/28 A simple LaTeX class for Computer Science classes]

%%% Options
\newif\if@french
\DeclareOption{french}{\@frenchtrue}

\newif\if@toc
\DeclareOption{toc}{\@toctrue}

\newif\if@titlepaged
\DeclareOption{titlepaged}{\@titlepagedtrue}

\newif\if@twocolumn
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@nodate
\DeclareOption{nodate}{\@nodatetrue}

\ProcessOptions\relax

\if@french
\usepackage[french]{babel}
\else
\usepackage[british]{babel}
\fi

%%% Packages
\if@twocolumn
\LoadClass[11pt,a4paper,twocolumn]{article}
\usepackage[a4paper,margin=1.5cm]{geometry}
\else
\LoadClass[12pt,a4paper]{article}
\usepackage[a4paper,margin=2cm]{geometry}
\fi

\usepackage{cmap}
\usepackage[T1]{fontenc} % for French
\usepackage[utf8]{inputenc}
\usepackage{csquotes}

\usepackage[kerning=true]{microtype} % micro-alignment

\usepackage{lmodern} % change the font

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{mathrsfs}
\usepackage{enumitem}
\usepackage{calc} % counters
\usepackage{dsfont} % mostly for \mathds{1}
\usepackage{stmaryrd} % llbracket, rrbracket
\usepackage{cancel}

\usepackage{mathtools}
\usepackage{wrapfig}
\usepackage{enumitem}
\usepackage[
    backend=biber,
    style=numeric
]{biblatex}

\usepackage{minted} % for code blocks
\usepackage{graphicx}
\usepackage{tikz}
\usepackage{tikz-3dplot} % for 3d plots
\usepackage{varwidth} % for text in TikZ rectangles

\usepackage{listofitems} % for \readlist to create arrays

\usepackage{xurl}
\usepackage{dirtytalk} % for the \say environment
\usepackage{booktabs} % for improved tabular lines
\usepackage{array} % for options in tabular columns types
\usepackage{ebproof} % for proof trees
\usepackage[justification=centering]{caption} % to center captions
\usepackage{titling}

\usepackage{parskip} % space between paragraphs

\usepackage{chngcntr} % figure counter within section
\usepackage[dvipsnames]{xcolor}

\usepackage{hyperref}
\hypersetup{
    colorlinks     = false,
    urlbordercolor = red,
    citecolor      = gray,
    breaklinks     = true
}

\usetikzlibrary{patterns, decorations.pathreplacing, bending, angles,quotes}
\usetikzlibrary{external}
\usetikzlibrary{hobby}
\usetikzlibrary{matrix}
\usetikzlibrary{calc}

\tikzexternalize[prefix=figures/]

\tikzstyle{nnnode}=[thick,draw=blue,fill=blue!20,circle,minimum size=22] % nodes for neural networks

\counterwithin{figure}{section}
\captionsetup[figure]{hypcap=false}

\graphicspath{{../cs-classes}, {images}}

\if@titlepaged
\AfterEndPreamble{
    \begin{titlepage}
        \centering
    
        \vspace*{1cm}
    
        % Title and subtitle are enclosed between two rules.
        \rule{\textwidth}{1.5pt}
    
        % Title
        \vspace{1.5\baselineskip}
        {\huge \textbf{\thetitle}}
        \vspace{.9\baselineskip}
        
        \rule{\textwidth}{1.5pt}
        \vspace{0.2cm}

        
        {
            \large
            \theauthor

            \vspace{.5\baselineskip}

            \if@french
            Notes de cours par Antoine Groudiev
            \else
            Class notes by Antoine Groudiev
            \fi
        }
    
        \large
    
        \vfill

        \includegraphics[width=.4\textwidth]{ens-psl-logo.png}
        
        \if@french
        Version du \today
        \else
        Last modified \today
        \fi
    \end{titlepage}
}
\else
\if@twocolumn\else\AfterEndPreamble{\maketitle}\fi
\setlength{\droptitle}{-5ex}
\pretitle{\begin{center}\LARGE\bfseries}
\fi

\if@toc
\AfterEndPreamble{\tableofcontents\newpage}
\else
\fi

\if@nodate
\date{\vspace*{-1cm}}
\else
\fi


% \numberwithin{equation}{subsection}

\if@twocolumn\else\renewcommand{\footnoterule}{\vfill\kern 4pt \hrule width 0.4\columnwidth \kern 2.6pt}\fi

% Change footnote symbols to arabic
\let\@fnsymbol\@arabic

%%% Theorems
\if@french
% Italic
\newtheorem*{remarque}{Remarque}
% Normal text
\theoremstyle{definition}
\newtheorem*{definition}{Définition}
\newtheorem*{theoreme}{Théorème}
\newtheorem{lemme}{Lemme}[section]
\newtheorem*{corollary}{Corollaire}
\newtheorem{propriete}{Propriété}[section]
\newtheorem*{exemple}{Exemple}
\else
% Italic
\newtheorem*{remark}{Remark}
% Normal text
\theoremstyle{definition}
\newtheorem*{definition}{Definition}
\newtheorem{exercise}{Exercise}
\newtheorem{question}{Question}
\newtheorem*{theorem}{Theorem}
\newtheorem{lemma}{Lemma}[section]
\newtheorem*{corollary}{Corollary}
\newtheorem{property}{Property}[section]
\newtheorem*{example}{Example}

\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\fi
