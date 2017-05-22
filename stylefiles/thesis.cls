\NeedsTeXFormat{LaTeX2e}

% 
% Load a base class. We will work from here.
% 
\LoadClass[
% 
% Use this for fast draft compilation with additional overfull boxes hint bars
% (also affects graphicx)
draft=false,
% 
% A4 paper size
a4paper,
% 
% Font size.
11pt,
]{scrbook}


% Load KOMA style options.
\RequirePackage{stylefiles/thesis-KOMA-options}

% Load packages for the thesis.

% To get i.e. umlauts for german thesises.
\RequirePackage[utf8]{inputenc}

% So we are able to copy umlauts out of our pdf later.
\RequirePackage[T1]{fontenc}

% For setting i.e. the margins of a page to some non-default value.
\RequirePackage[a4paper]{geometry}

% Definitely load both patterns as an english thesis at a german university also
% has an introduction in german.
\RequirePackage[american, ngerman]{babel}

% A nice default font. This also adds around 180kB of size to the output pdf.
\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}

% For coloring stuff we have to edit later.
\RequirePackage[table]{xcolor}

% Clickable references, table of contents, equations, etc.
\RequirePackage[
unicode,
plainpages=false,
hyperfootnotes=false,
colorlinks=false
]{hyperref}

% A nicer way for referencing. When making a label, use
% \label{CAT:NAME}, where CAT is either one of {chap, sec, eq, tab, fig}.
% Then call (i.e.) \cref{eq:one}, which will resolve to Equation 1.
\usepackage[ngerman,noabbrev]{cleveref}
\creflabelformat{equation}{#2(#1)#3}
\crefrangelabelformat{equation}{#3(#1)#4 bis #5(#2)#6}
\labelcrefformat{subequation}{#2(#1)#3}
\labelcrefrangeformat{subequation}{#3(#1)#4 bis #5(#2)#6}

% Nice captioning and referencing of subfigures.
\usepackage{subfig}
% 
% Nicer layout for figure captions (load after subfig package).
\usepackage[
margin=8pt,
font=small,
textfont=it,
labelfont=bf,
format=plain]{caption}   


% For proportional sum and integral signs
\usepackage{exscale}

% For publishable tables. Use \toprule, \midrule, \bottomrule for horizontal
% lines in tables.
\usepackage{booktabs}


\usepackage{empheq}   %%% for boxed equations and alike
\usepackage{amsmath}  %%% math symbols needed
\usepackage{amsfonts} %%% math fonts needed
\usepackage{amssymb}  %%% maths symbols needed 
% \usepackage{amsthm}   %%% theorem environments
\usepackage{dsfont}   %%% for blackboard numbers and characters
\usepackage{mathrsfs}
%\usepackage{mathdots/mathdots} %%% for ellipses in math mode

\usepackage{fancybox} %%% more types of boxes 

\usepackage[pdftex]{graphicx}       %%% CUSTOMIZATION: include all pictures

\usepackage{float}      %%% define custom float environments

\RequirePackage{etoolbox}
\AtEndPreamble{\RequirePackage{scrhack}}

\definecolor{my_red}{rgb}{0.5,0,0}
\definecolor{my_green}{rgb}{0,0.5,0}
\definecolor{my_blue}{rgb}{0,0,0.5}
\hypersetup{
  % pdftitle={},
  % pdfauthor={},
  pdfsubject={},
  pdfkeywords={},
  % pdfborder=000,
  colorlinks=false,
  urlcolor=my_red,
  linkcolor=my_blue,
  citecolor=my_green,
  pdfpagemode=UseNone,
  plainpages=false,
  bookmarksopen=true,
  bookmarksnumbered=true,
  final=true
}



% 
% Load our custom packages.
%
%
% Load the package for setting the titlepage, ToC, dedications and so on.
% Provides a command \makefrontmatter.
% 
\RequirePackage{stylefiles/thesis-makefrontmatter}
\RequirePackage{stylefiles/thesis-makebackmatter}

% Customize the bibliography.
\RequirePackage{stylefiles/thesis-bibliography}

% 
% Option logic.
% Bachelor, Master, PhD
\newif\ifthesis@bachelor
\newif\ifthesis@master
\newif\ifthesis@phd

% % German, English
% \newif\ifthesis@ngerman
% \newif\ifthesis@english

\DeclareOption{bachelor}{\thesis@bachelortrue\thesis@masterfalse\thesis@phdfalse}
\DeclareOption{master}{\thesis@bachelorfalse\thesis@mastertrue\thesis@phdfalse}
\DeclareOption{phd}{\thesis@bachelorfalse\thesis@masterfalse\thesis@phdtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\ProcessOptions\relax

\ifthesis@bachelor
\ThesisDegree{Bachelor}
\ThesisDegreeShort{B.}
\fi
\ifthesis@master
\ThesisDegree{Master}
\ThesisDegreeShort{M.}
\fi
\ifthesis@phd
\ThesisDegree{\color{red}Ph.D.}
\ThesisDegreeShort{\color{red}Ph.D.}
\fi



%
% Provide the class.
% 
\ProvidesClass{stylefiles/thesis}