\NeedsTeXFormat{LaTeX2e}

% Load a base class. We will work from here.
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

% Load the titlepage package. See the package itself for commands to edit all
% the things.
\RequirePackage{stylefiles/thesis-titlepage}

% Provide the class.
\ProvidesClass{stylefiles/thesis}