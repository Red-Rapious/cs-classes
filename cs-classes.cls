\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-classes/cs-classes}[2024/01/28 A simple LaTeX class for Computer Science classes]

% Options
\newif\if@french
\DeclareOption{french}{\@frenchtrue}

\newif\if@toc
\DeclareOption{toc}{\@toctrue}

\ProcessOptions\relax

\if@french
\usepackage[french]{babel}
\else
\usepackage[british]{babel}
\fi


\LoadClass[12pt,a4paper]{article}
\usepackage[a4paper,margin=2cm]{geometry}

\usepackage{cmap}
\usepackage[T1]{fontenc} % for French
\usepackage[utf8]{inputenc}
\usepackage{csquotes}

\usepackage[kerning=true]{microtype}

\usepackage{lmodern}

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{mathrsfs}
\usepackage{enumitem}  
\usepackage{calc}
\usepackage{dsfont} % mostly for \mathds{1}
\usepackage{stmaryrd}

\usepackage{mathtools}
\usepackage{wrapfig}
\usepackage{enumitem}
\usepackage[
    backend=biber,
    style=numeric
]{biblatex}

\usepackage{minted}
\usepackage{graphicx}
\usepackage{tikz}
\usetikzlibrary{patterns, decorations.pathreplacing, bending, angles,quotes}
\usepackage{xurl}
\usepackage{dirtytalk} % for the \say environment
\usepackage{booktabs}
\usepackage{array}

\usepackage{hyperref}

\if@toc
\AfterEndPreamble{\maketitle\tableofcontents}
\else
\AfterEndPreamble{\maketitle}
\fi

\usepackage{titling}
\setlength{\droptitle}{-5ex}
\pretitle{\begin{center}\LARGE\bfseries}

\numberwithin{equation}{subsection}

% Changed classical symbols
\let\temp\phi
\let\phi\varphi
\let\varphi\temp
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\leq}{\leqslant}
\renewcommand{\geq}{\geqslant}

% Theorems
\if@french
\newtheorem*{theoreme}{Théorème}
\newtheorem{lemme}{Lemme}
\newtheorem*{corollary}{Corollaire}
\newtheorem{propriete}{Propriété}
\newtheorem*{exemple}{Exemple}
\newtheorem*{remarque}{Remarque}
\theoremstyle{definition}
\newtheorem*{definition}{Définition}
\else
\newtheorem*{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem*{corollary}{Corollary}
\newtheorem{property}{Property}
\newtheorem*{example}{Example}
\newtheorem*{remark}{Remark}
\theoremstyle{definition}
\newtheorem*{definition}{Definition}
\newtheorem{exercise}{Exercise}

\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\fi

% Usefull new commands
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\A}{\mathcal{A}}
\newcommand{\E}{\mathbb{E}}
\renewcommand{\L}{\mathcal{L}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\Pc}{\mathcal{P}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\X}{\mathcal{X}}
\newcommand{\I}{\mathbb{I}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\Y}{\mathcal{Y}}
\newcommand{\until}{\mathfrak{U}}

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

% Custom commands
\newcommand*{\set}[2]{\left\{\,#1 \: \middle| \: #2\,\right\}}
\newcommand*{\trace}[1]{\langle #1 \rangle}
\newcommand*{\sem}[1]{\llbracket #1 \rrbracket}
\newcommand*{\roundsem}[1]{\llparenthesis #1 \rrparenthesis}
\newcommand*{\ind}{\mathds{1}}

% Custom environments
\newenvironment{grammar}
    {
    \setlength\tabcolsep{4pt}
    \begin{tabular}{>{$}l<{$}>{$}r<{$}>{$}l<{$}}
    }
    { 
    \end{tabular}
    }
\newcommand*{\firstrule}[2]{#1 &::= & #2\\}
\newcommand*{\grule}[1]{&| &#1\\}