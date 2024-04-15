\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-classes/cs-classes}[2024/01/28 A simple LaTeX class for Computer Science classes]

%%% Options
\newif\if@french
\DeclareOption{french}{\@frenchtrue}

\newif\if@toc
\DeclareOption{toc}{\@toctrue}

\newif\if@titlepaged
\DeclareOption{titlepaged}{\@titlepagedtrue}

\ProcessOptions\relax

\if@french
\usepackage[french]{babel}
\else
\usepackage[british]{babel}
\fi

%%% Packages
\LoadClass[12pt,a4paper]{article}
\usepackage[a4paper,margin=2cm]{geometry}

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
\usepackage{booktabs} % for improved tabular lines
\usepackage{array} % for options in tabular columns types
\usepackage{ebproof} % for proof trees
\usepackage{caption} % to center captions
\usepackage{titling}

\usepackage{parskip} % space between paragraphs

\usepackage{hyperref}

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
\AfterEndPreamble{\maketitle}
\setlength{\droptitle}{-5ex}
\pretitle{\begin{center}\LARGE\bfseries}
\fi

\if@toc
\AfterEndPreamble{\tableofcontents\newpage}
\else
\fi


\numberwithin{equation}{subsection}

\renewcommand{\footnoterule}{\vfill\kern -4pt \hrule width 0.4\columnwidth \kern 2.6pt}

%%% Change classical symbols
\let\temp\phi
\let\phi\varphi
\let\varphi\temp
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\leq}{\leqslant}
\renewcommand{\geq}{\geqslant}

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

%%% Usefull new commands
% Special maths letters
\newcommand{\N}{\mathbb{N}}
\newcommand{\Zc}{\mathcal{Z}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\A}{\mathcal{A}}
\newcommand{\Ab}{\mathbb{A}}
\newcommand{\Ec}{\mathcal{E}}
\renewcommand{\L}{\mathcal{L}}
\newcommand{\Pc}{\mathcal{P}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\X}{\mathcal{X}}
\newcommand{\I}{\mathbb{I}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\Y}{\mathcal{Y}}

% Probability
\newcommand{\E}{\mathbb{E}} % expectation
\renewcommand{\P}{\mathbb{P}} % probability
\newcommand{\V}{\mathbb{V}} % variance
\DeclareMathOperator*{\Cov}{Cov} % covariance

% Machine learning
\newcommand{\risk}{\mathcal{R}} % risk
\newcommand{\emrisk}{\hat{\mathcal{R}}} % empirical risk
\newcommand{\exrisk}{\mathscr{R}} % excess risk
\newcommand{\hatf}{\hat{f}}
\newcommand{\htheta}{\hat{\theta}}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}

% Linear Algebra
\DeclareMathOperator*{\im}{Im} % image
\DeclareMathOperator*{\rg}{rg} % rank
\DeclareMathOperator*{\Tr}{Tr} % trace
\newcommand{\tp}{\top} % Transpose
\DeclareMathOperator*{\diag}{diag} % diagonal matrix

\DeclareMathOperator*{\Conv}{Conv} % Convex Hull
\DeclareMathOperator*{\Span}{Span} % Convex Hull

% Semantics
\DeclarePairedDelimiter{\sem}{\llbracket}{\rrbracket}
\newcommand{\until}{\mathfrak{U}}

% Misc.
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\newcommand{\dd}{\,\textnormal{d}}
\DeclarePairedDelimiter{\openseg}{\rbrack}{\lbrack}

%%% Custom commands
\newcommand*{\set}[2]{\left\{\,#1 \: \middle| \: #2\,\right\}}
\newcommand*{\trace}[1]{\langle #1 \rangle}
\newcommand*{\iset}[2]{\sem{#1, #2}}
\newcommand*{\roundsem}[1]{\llparenthesis #1 \rrparenthesis}
\newcommand*{\ind}{\mathds{1}}
\newcommand*{\false}{\textnormal{false}}
\newcommand*{\true}{\textnormal{true}}
\newcommand*{\hoare}[3]{\left\{#1\right\} \; #2 \; \left\{#3\right\}}
\newcommand*{\sqhoare}[3]{\left[#1\right] \; #2 \; \left[#3\right]}

\newcommand*{\mathpdf}[1]{\texorpdfstring{$#1$}{#1}}

\newcommand*{\where}{\quad\textnormal{where}\quad}

%%% Custom environments
% Grammar in math mode
\newenvironment{mgrammar}
    {
    \setlength\tabcolsep{4pt}
    \begin{tabular}{>{$}l<{$}>{$}r<{$}>{$}l<{$} r}
    }
    { 
    \end{tabular}
    }

% Grammar in text mode
\newenvironment{grammar}
    {
    \setlength\tabcolsep{4pt}
    \begin{tabular}{l r l r}
    }
    { 
    \end{tabular}
    }

% Command for grammar lines
\newcommand*{\firstrule}[3]{#1 &::= & #2& \quad \ifstrempty{#3}{}{\textit{(#3)}}\\}
\newcommand*{\grule}[2]{&| &#1& \quad \ifstrempty{#2}{}{\textit{(#2)}}\\}
\newcommand*{\gskip}{&&\\}