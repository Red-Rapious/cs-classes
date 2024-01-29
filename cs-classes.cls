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
\usepackage[T1]{fontenc}
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

\usepackage{mathtools}
\usepackage{wrapfig}
\usepackage{enumitem}
\usepackage[
    backend=biber,
    style=numeric
]{biblatex}

\usepackage{minted}

\usepackage{hyperref}

\if@toc
\AfterBeginDocument{\maketitle\tableofcontents}
\else
\AfterBeginDocument{\maketitle}
\fi

\usepackage{titling}
\setlength{\droptitle}{-5ex}
\pretitle{\begin{center}\LARGE\bfseries}

% Changed classical symbols
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\leq}{\leqslant}
\renewcommand{\geq}{\geqslant}

% Theorems
\if@french
\newtheorem*{theoreme}{Théorème}
\newtheorem*{propriete}{Propriété}
\newtheorem*{example}{Example}
\newtheorem*{remarque}{Remarque}
\theoremstyle{definition}
\newtheorem*{definition}{Définition}
\else
\newtheorem*{theorem}{Theorem}
\newtheorem*{property}{Property}
\newtheorem*{example}{Example}
\newtheorem*{remark}{Remark}
\theoremstyle{definition}
\newtheorem*{definition}{Definition}
\fi

% Usefull new commands
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\A}{\mathcal{A}}

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}