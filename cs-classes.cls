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
\usepackage{tikz-3dplot} % for 3d plots
\usepackage{varwidth} % for text in TikZ rectangles

\usepackage{listofitems} % for \readlist to create arrays

\usepackage{xurl}
\usepackage{dirtytalk} % for the \say environment
\usepackage{booktabs} % for improved tabular lines
\usepackage{array} % for options in tabular columns types
\usepackage{ebproof} % for proof trees
\usepackage{caption} % to center captions
\usepackage{titling}

\usepackage{parskip} % space between paragraphs

\usepackage{chngcntr} % figure counter within section

\usepackage{hyperref}
\hypersetup{
    colorlinks     = false,
    urlbordercolor = red,
    citecolor      = gray,
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

\renewcommand{\footnoterule}{\vfill\kern 4pt \hrule width 0.4\columnwidth \kern 2.6pt}

\let\@fnsymbol\@arabic

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
\newcommand{\N}{\mathbb{N}} % Natural numbers
\newcommand{\Zc}{\mathcal{Z}} % Some set
\newcommand{\Z}{\mathbb{Z}} % Relative numbers
\newcommand{\Q}{\mathbb{Q}} % Rationnal numbers
\newcommand{\R}{\mathbb{R}} % Real numbers
\newcommand{\C}{\mathbb{C}} % Complex numbers
\newcommand{\A}{\mathcal{A}} % Automata
\newcommand{\Ab}{\mathbb{A}} % Semantic arrays set
\newcommand{\Ec}{\mathcal{E}} % Semantic expressions
\renewcommand{\L}{\mathcal{L}} % Loss function
\newcommand{\Pc}{\mathcal{P}} % Parts of a set
\renewcommand{\S}{\mathcal{S}} % Semantic
\newcommand{\X}{\mathcal{X}} % Input set
\newcommand{\I}{\mathbb{I}} % Semantic integers
\newcommand{\T}{\mathcal{T}}
\newcommand{\Y}{\mathcal{Y}} % Output set
\newcommand{\F}{\mathcal{F}}

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
\DeclareMathOperator*{\KL}{KL} % Kullback-Leibler divergence
\DeclareMathOperator*{\ReLU}{ReLU}
\DeclareMathOperator*{\softmax}{softmax}

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
\newcommand*{\trace}[1]{\langle #1 \rangle}

% Misc.
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\newcommand{\dd}{\,\textnormal{d}} % Derivative d
\DeclarePairedDelimiter{\openseg}{\rbrack}{\lbrack} % Open segment ]a, b[

%%% Custom commands
\newcommand*{\set}[2]{\left\{\,#1 \: \middle| \: #2\,\right\}} % Set of the form { x | y }
\newcommand*{\iset}[2]{\sem{#1, #2}} % Integer set with double bars
\newcommand*{\roundsem}[1]{\llparenthesis #1 \rrparenthesis}
\newcommand*{\ind}{\mathds{1}} % Indicator
\newcommand*{\false}{\textnormal{false}}
\newcommand*{\true}{\textnormal{true}}
\newcommand*{\hoare}[3]{\left\{#1\right\} \; #2 \; \left\{#3\right\}} % Hoare triple
\newcommand*{\sqhoare}[3]{\left[#1\right] \; #2 \; \left[#3\right]} % Square Hoare triple

% Used to add math in title without causing a PDF error
\newcommand*{\mathpdf}[1]{\texorpdfstring{$#1$}{#1}}

\newcommand*{\where}{\quad\textnormal{where}\quad}

% ∂f/∂x
\newcommand*{\partfrac}[2]{\frac{\partial#1}{\partial#2}}

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

% TikZ macros
\newcommand*{\parallelepiped}[8]{
    \pgfmathsetmacro{\cubex}{#2}
    \pgfmathsetmacro{\cubey}{#3}
    \pgfmathsetmacro{\cubez}{#4}

    \draw[fill=#8, thick] #1 -- ++ (-\cubex,0,0) -- node[left, pos=.5] {#6} ++ (0,-\cubey,0) -- node[below, pos=.5] {#5} ++(\cubex,0,0) --  cycle;
    \draw[fill=#8!gray!80, thick] #1 -- ++(0,0,-\cubez) -- ++(0,-\cubey,0) -- node[right=2, pos=.5] {#7} ++(0,0,\cubez) -- cycle;
    \draw[fill=#8, thick] #1 -- ++(-\cubex,0,0) -- ++(0,0,-\cubez) -- ++(\cubex,0,0) -- cycle;
}