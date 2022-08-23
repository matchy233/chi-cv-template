\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chicv}[2022/08/21 A CV template based on the Curriculum Vitae of Alex Chi Zhang]
\LoadClass[10pt]{article} % based on article class

%
\RequirePackage[
    a4paper,
    left=0.8in,
    right=0.8in,
    top=0.5in,
    bottom=0.5in,
    nohead
]{geometry}

% For font setting
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
% For color
\RequirePackage{xcolor}

% For smarter command definition
\RequirePackage{xifthen}
\RequirePackage{xparse}

% For hyperlink customization
\RequirePackage{hyperref}
\RequirePackage{fontawesome} % icons


%% ----------------- END OF PACKAGES ----------------- %%

% Spacings
\setlength{\parindent}{0pt}
\RequirePackage{enumitem}
\setlist[itemize]{
    leftmargin=36pt,
    itemsep=.01em,
    topsep=.1em
}

% \let\olditemize\itemize
% \let\endolditemize\enditemize
% \RenewDocumentEnvironment{itemize}{O{}}
%   {\begin{olditemize}[#1]
%      \let\olditem\item
%      \RenewDocumentCommand{\item}{s}{%
%        \IfBooleanTF{##1}
%          {\olditem[]}
%          {\olditem}}
%      }
%   {\end{olditemize}}

% Font size macros
\newcommand{\HUGE}{\@setfontsize\HUGE{24pt}{18}}
\renewcommand\Huge{\@setfontsize\Huge{22pt}{18}}
\renewcommand\huge{\@setfontsize\huge{20pt}{18}}
\renewcommand\LARGE{\@setfontsize\LARGE{18pt}{18}}
\renewcommand\Large{\@setfontsize\Large{12pt}{18}}
\renewcommand\large{\@setfontsize\large{11pt}{18}}

% mainfont: XCharter
\IfFontExistsTF{XCharter}{
    \setmainfont{XCharter}
}{
    \setmainfont{XCharter}[ % in case XCharter is not installed
        Path = ./fonts/,
        Extension = .otf,
        BoldFont = XCharter-Bold,
        ItalicFont = XCharter-Italic,
        BoldItalicFont = XCharter-BoldItalic,
        BoldSlantedFont = XCharter-BoldSlanted,
        SlantedFont = XCharter-Slanted,
        RomanFont = XCharter-Roman,
    ]
}

% heading font: Avenir Next
\IfFontExistsTF{Avenir Next LT Pro}{
    \newfontfamily{\headingfont}{Avenir Next LT Pro}
}{
    \IfFontExistsTF{Avenir Next}{
        \newfontfamily{\headingfont}{Avenir Next}
    }{
        % use local font in ./fonts folder
        \newfontfamily{\headingfont}{Avenir Next LT Pro}[
            Path = ./fonts,
            Extension = .otf,
            BoldFont = AvenirNextLTPro-Bold,
            ItalicFont = AvenirNextLTPro-Italic,
        ]
    }
}


% format for section title
\titleformat{\section}
    {\headingfont\Large}                % shape
    {}                                  % format
    {0em}                               % label
    {\vspace{-2ex}{\color{gray}\hrule}}  % before-code
    []                                  % after-code
\titlespacing{\section}
    {0pt} % left spacing
    {0pt} % before spacing
    {0pt} % after spacing

% format for subseciton title
\titleformat{\subsection}
    {\large} % shape
    {} % format
    {0em} % label
    {} % beforcode
    [] % aftercode
\titlespacing{\subsection}
    {12pt} % left spacing
    {\parskip} % before spacing
    {-\parskip} % after spacing

\NewDocumentCommand{\cventry}{ m m o o }
{
    \subsection[#1]{\textbf{#1} \hfill #2 }
    \IfNoValueTF{#3}
    {}
    {{\parindent=12pt\par #3 \hfill #4 \par}}
}


\NewDocumentCommand{\name}{ m }
{
    {
        \headingfont\Huge#1
    }
}


\newenvironment{skilllist}
{
    \begin{itemize}[
        leftmargin=12pt,
        itemsep=0em,
    ]
}
{
    \end{itemize}
}


%% embeded social media link command
\hypersetup{%
  colorlinks=false,% hyperlinks will be black
  linkbordercolor=black,
  pdfborderstyle={/S/U/W 1}% border style will be underline of width 1pt
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}

% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\faPhone\ {#1}}

% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

\newcommand{\linkedinsquare}[2][]{\faLinkedinSquare\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}


\newcommand{\basicinfo}[1]{
  {\par \large{#1} \par}
}
