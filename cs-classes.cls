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


\numberwithin{equation}{subsection}

\if@twocolumn\else\renewcommand{\footnoterule}{\vfill\kern 4pt \hrule width 0.4\columnwidth \kern 2.6pt}\fi

% Change footnote symbols to arabic
\let\@fnsymbol\@arabic

% Support for mathbb-like digits
\DeclareMathAlphabet{\digitsbb}{U}{bbold}{m}{n}

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
\newcommand{\A}{\mathcal{A}} % Automata
\newcommand{\Ab}{\mathbb{A}} % Semantic arrays set
\newcommand{\B}{\mathbb{B}} % Boolean set
\newcommand{\C}{\mathbb{C}} % Complex numbers
\newcommand{\Cc}{\mathcal{C}} % Configuration space
\newcommand{\D}{\mathcal{D}} % Distribution
\newcommand{\Ds}{\mathscr{D}}
\newcommand{\Ec}{\mathcal{E}} % Semantic expressions
\newcommand{\F}{\mathcal{F}} % Function set
\newcommand{\G}{\mathcal{G}} % Graph
\newcommand{\Hc}{\mathcal{H}} % Hilbert space
\newcommand{\I}{\mathbb{I}} % Semantic integers
\renewcommand{\L}{\mathcal{L}} % Loss function
\newcommand{\N}{\mathbb{N}} % Natural numbers
\newcommand{\Nc}{\mathcal{N}} % Normal distribution
\newcommand{\Pc}{\mathcal{P}} % Parts of a set
\newcommand{\Q}{\mathbb{Q}} % Rationnal numbers
\newcommand{\R}{\mathbb{R}} % Real numbers
\newcommand{\Rc}{\mathcal{R}}
\renewcommand{\S}{\mathcal{S}} % Semantic
\newcommand{\Sb}{\mathbb{S}} % Symmetric matrices
\newcommand{\T}{\mathcal{T}}
\newcommand{\X}{\mathcal{X}} % Input set
\newcommand{\Y}{\mathcal{Y}} % Output set
\newcommand{\Z}{\mathbb{Z}} % Relative numbers
\newcommand{\Zc}{\mathcal{Z}} % Some set

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
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\KL}{D_{\mathrm{KL}}} % Kullback-Leibler divergence
\DeclareMathOperator{\ReLU}{ReLU}
\DeclareMathOperator{\softmax}{softmax}
\DeclareMathOperator{\JSD}{JSD} % Jensen-Shannon divergence

% Linear Algebra
\DeclareMathOperator{\im}{Im} % image
\DeclareMathOperator{\Ker}{Ker} % kernel
\DeclareMathOperator{\rg}{rg} % rank
\DeclareMathOperator{\rank}{rank} % rank
\DeclareMathOperator{\Tr}{Tr} % trace
\newcommand{\tp}{\top} % Transpose
\DeclareMathOperator{\diag}{diag} % diagonal matrix

\DeclareMathOperator*{\Conv}{Conv} % Convex Hull
\DeclareMathOperator*{\Span}{Span} % Convex Hull
\DeclareMathOperator*{\dom}{dom} % Effective domain
\DeclareMathOperator*{\epi}{epi} % Epigraph
\DeclareMathOperator*{\dist}{dist} % Epigraph

\DeclareMathOperator*{\SO}{SO} % Special Orthogonal group
\DeclareMathOperator*{\so}{so}
\DeclareMathOperator*{\SE}{SE} % Special Euclidian group
\DeclareMathOperator*{\se}{se} % Special Euclidian group

% Topology
\DeclareMathOperator{\interior}{int} % Interior
\DeclareMathOperator{\relint}{relint} % Relative interior

% Semantics
\DeclarePairedDelimiter{\sem}{\llbracket}{\rrbracket}
\newcommand{\until}{\mathfrak{U}}
\newcommand*{\trace}[1]{\langle #1 \rangle}

% Misc.
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\newcommand{\dd}{\,\textnormal{d}} % Derivative d
\DeclarePairedDelimiter{\openseg}{\rbrack}{\lbrack} % Open segment ]a, b[
\DeclareMathOperator*{\atantwo}{atan2}
\DeclareMathOperator*{\minimize}{minimize\:}
\DeclareMathOperator*{\maximize}{maximize\:}
\newcommand*{\subj}{\quad\text{subject to}\quad}
\DeclareMathOperator*{\sign}{sign}

%%% Custom commands
\newcommand*{\set}[2]{\left\{\,#1 \: \middle| \: #2\,\right\}} % Set of the form { x | y }
\newcommand*{\inner}[2]{\left\langle#1 \, \middle| \, #2\right\rangle} % Inner product <·|·>
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

% Strikeout in math mode
\newcommand\hcancel[2][black]{\setbox0=\hbox{$#2$}%
\rlap{\raisebox{.35\ht0}{\textcolor{#1}{\rule{\wd0}{1.5pt}}}}#2} 

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

    \draw[fill=#8, thick, line join=round] #1 -- ++ (-\cubex,0,0) -- node[left, pos=.5] {#6} ++ (0,-\cubey,0) -- node[below, pos=.5] {#5} ++(\cubex,0,0) --  cycle;
    \draw[fill=#8!gray!80, thick, line join=round] #1 -- ++(0,0,-\cubez) -- ++(0,-\cubey,0) -- node[right=2, pos=.5] {#7} ++(0,0,\cubez) -- cycle;
    \draw[fill=#8, thick, line join=round] #1 -- ++(-\cubex,0,0) -- ++(0,0,-\cubez) -- ++(\cubex,0,0) -- cycle;
}