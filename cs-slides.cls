\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-classes/cs-slides}[2024/01/28 A simple LaTeX class for Beamer-based slides]
\LoadClass[aspectratio=169]{beamer}
\usetheme{Singapore}

\setbeamertemplate{caption}[numbered]

% Add page numbers at the bottom of the slides
\addtobeamertemplate{navigation symbols}{}{%
    \usebeamerfont{footline}%
    \usebeamercolor[fg]{footline}%
    \hspace{1em}%
    \raisebox{1.4pt}[0pt][0pt]{\insertframenumber/\inserttotalframenumber}
}
% TODO: remove navigation symbols but keep the page numbers

\usefonttheme{structurebold} % bold titles
\usefonttheme[onlymath]{serif} % use classic LaTeX font for maths

% \definecolor{primarycolor}{HTML}{0000FF}
% \makeatletter

% \def\sectioncolor{primarycolor}% color to be applied to section headers

% \setbeamercolor{palette primary}{use=structure,fg=structure.fg}
% \setbeamercolor{palette secondary}{use=structure,fg=structure.fg!75!black}
% \setbeamercolor{palette tertiary}{use=structure,fg=structure.fg!50!black}
% \setbeamercolor{palette quaternary}{fg=black}

% \setbeamercolor{local structure}{fg=primarycolor}
% \setbeamercolor{structure}{fg=primarycolor}
% \setbeamercolor{title}{fg=primarycolor}
% \setbeamercolor{section in head/foot}{fg=black}

% \setbeamercolor{normal text}{fg=black,bg=white}
% \setbeamercolor{block title alerted}{fg=red}
% \setbeamercolor{block title example}{fg=primarycolor}

% \setbeamercolor{footline}{fg=primarycolor!50}
% \setbeamerfont{footline}{series=\bfseries}


\graphicspath{{../images/}}

% Show the table of contents at the beginning of each section
\AtBeginSection[]
{
  \begin{frame}
    \frametitle{Plan}
    \tableofcontents[currentsection]
  \end{frame}
}

\usepackage{cmap}
\usepackage[english]{babel}
\usepackage[T1]{fontenc}
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
\usepackage{multirow}
\usepackage{ebproof} % for proof trees
\usepackage[justification=centering]{caption} % to center captions

\usepackage{parskip} % space between paragraphs

\usepackage[backend=biber, style=numeric]{biblatex}

\usepackage{chngcntr} % figure counter within section
\usepackage[dvipsnames]{xcolor}

\usepackage{hyperref}
% \hypersetup{
%     colorlinks     = false,
%     urlbordercolor = red,
%     citecolor      = gray,
%     breaklinks     = true
% }

\usetikzlibrary{patterns, decorations.pathreplacing, bending, angles,quotes}
\usetikzlibrary{external}
\usetikzlibrary{hobby}
\usetikzlibrary{matrix}
\usetikzlibrary{calc}

\tikzexternalize[prefix=figures/]

\tikzstyle{nnnode}=[thick,draw=blue,fill=blue!20,circle,minimum size=22] % nodes for neural networks

% TODO: clean author handling
% \author{%
%   \texorpdfstring{%
%     \begin{columns}
%       \column{.5\linewidth}
%       \centering
%       \textbf{Name 1} \\ Affiliation 1
%       \column{.5\linewidth}
%       \centering
%       \textbf{Name 2} -- Supervisor \\ Affiliation 2
%     \end{columns}
%  }
%  {Name 1, Name 2}
% }

% TODO: image handling?
% \titlegraphic{\includegraphics[height=1.6cm]{logo1.png}\hspace{2cm}\includegraphics[height=1.3cm]{logo2.png}}

\AfterEndPreamble{\frame{\titlepage}}

% TODO: automatic references slide at the end
% \begin{frame}[allowframebreaks]{References}
%     \nocite{*}
%     \printbibliography
% \end{frame}