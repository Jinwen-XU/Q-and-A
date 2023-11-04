%%
%% Copyright (C) 2023 by Jinwen XU
%% -------------------------------
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3c of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesExplClass
  {Q-and-A}
  {2023/11/01} {}
  {Document class for typesetting Q&A conversation}

\keys_define:nn { Q-and-A }
  {
    , scroll      .bool_set:N   = \l__QA_scroll_bool
    , scroll      .initial:n    = { false }

    , theme             .str_set:N          = \l__QA_theme_str
    , theme             .initial:n          = { default }
    , use-theme         .str_set:N          = \l__QA_theme_str
    , use~theme         .str_set:N          = \l__QA_theme_str
    , use theme         .str_set:N          = \l__QA_theme_str
    , ChatGPT           .meta:n             = { theme = ChatGPT-light }
    , ChatGPT-light     .meta:n             = { theme = ChatGPT-light }
    , ChatGPT~light     .meta:n             = { theme = ChatGPT-light }
    , ChatGPT light     .meta:n             = { theme = ChatGPT-light }
    , ChatGPT-dark      .meta:n             = { theme = ChatGPT-dark  }
    , ChatGPT~dark      .meta:n             = { theme = ChatGPT-dark  }
    , ChatGPT dark      .meta:n             = { theme = ChatGPT-dark  }

    , unknown     .code:n       = {
                                    \PassOptionsToClass { \CurrentOption } { minimart }
                                    \PassOptionsToClass { \CurrentOption } { einfart }
                                    \PassOptionsToPackage { \CurrentOption } { ProjLib }
                                  }
  }
\ProcessKeyOptions [ Q-and-A ]

\sys_if_engine_pdftex:TF
  {
    \PassOptionsToClass { use indent = false } { minimart }
    \LoadClass { minimart }
  }
  {
    \PassOptionsToClass { use indent = false } { einfart }
    \LoadClass { einfart }
  }

\RequirePackage { ProjLib }

\colorlet{QA-Q-back}{.!3}
\colorlet{QA-Q-text}{.}
\colorlet{QA-Q-emph}{.}
\colorlet{QA-A-back}{.!0}
\colorlet{QA-A-text}{.}
\colorlet{QA-A-emph}{.}
\colorlet{QA-N-back}{.!0}
\colorlet{QA-N-text}{.}
\colorlet{QA-N-emph}{.}

\definecolor{QA-code-back}{RGB}{  0,  0,  0}
\definecolor{QA-code-text}{RGB}{255,255,255}
\definecolor{QA-code-title-back}{RGB}{ 52, 53, 65}
\definecolor{QA-code-title-text}{RGB}{217,217,227}

\colorlet{QA-sep-line}{.!27!paper}

\colorlet{paper}{QA-A-back}
\colorlet{main-text}{QA-A-text}
\colorlet{emph-text}{QA-A-text}

\str_if_eq:onT { \l__QA_theme_str } { ChatGPT-dark }
  {
    \definecolor{QA-Q-back}{RGB}{ 52, 53, 65}
    \definecolor{QA-Q-text}{RGB}{236,236,241}
    \definecolor{QA-Q-emph}{RGB}{255,255,255}
    \definecolor{QA-A-back}{RGB}{ 68, 70, 84}
    \definecolor{QA-A-text}{RGB}{209,213,219}
    \definecolor{QA-A-emph}{RGB}{255,255,255}
    \colorlet{QA-N-back}{QA-Q-back}
    \colorlet{QA-N-text}{QA-Q-text}
    \colorlet{paper}{QA-Q-back}
    \colorlet{main-text}{QA-Q-text}
    \colorlet{emph-text}{QA-Q-text}
  }

\str_if_eq:onT { \l__QA_theme_str } { ChatGPT-light }
  {
    \definecolor{QA-Q-back}{RGB}{255,255,255}
    \definecolor{QA-Q-text}{RGB}{ 52, 53, 65}
    \definecolor{QA-Q-emph}{RGB}{  0,  0,  0}
    \definecolor{QA-A-back}{RGB}{247,247,248}
    \definecolor{QA-A-text}{RGB}{ 55, 65, 81}
    \definecolor{QA-A-emph}{RGB}{  0,  0,  0}
    \colorlet{QA-N-back}{QA-Q-back}
    \colorlet{QA-N-text}{QA-Q-text}
    \colorlet{paper}{QA-Q-back}
    \colorlet{main-text}{QA-Q-text}
    \colorlet{emph-text}{QA-Q-text}
  }

\projlib_paper_set_page_color:n { paper }
\projlib_paper_set_text_color:n { main-text }

\projlib_langauge_define_multilingual_text:Nn \l_QA_continued_text_tl
  {
    , EN = (continued)
    , FR = (suite~de~la~page~précédente)
    , DE = (Fortsetzung~von~der~vorherigen~Seite)
    , IT = (continua~dalla~pagina~precedente)
    , PT = (continuação~da~página~anterior)
    , BR = (continuação~da~página~anterior)
    , ES = (continúa~de~la~página~anterior)
    , CN = （接前页）
    , TC = （接前頁）
    , JP = （前頁から続き）
    , RU = (продолжение~с~предыдущей~страницы)
  }

\RequirePackage { enumitem }

\dim_new:N \l_QA_item_indentation_dim
\dim_set:Nn \l_QA_item_indentation_dim { 1.5em }
\dim_new:N \l_QA_list_indentation_dim
\dim_set:Nn \l_QA_list_indentation_dim { 3em }
\dim_new:N \l_QA_list_labelsep_dim
\dim_set:Nn \l_QA_list_labelsep_dim { 1em }

\exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
  {
    \dim_set:Nn \l_QA_item_indentation_dim { .25em }
    \dim_set:Nn \l_QA_list_indentation_dim { 4.5em }
    \dim_set:Nn \l_QA_list_labelsep_dim { 1.5em }
  }

\newlist { QA-entry } { description } { 1 }
\setlist [ QA-entry ] { font = \normalfont\sffamily, leftmargin = \l_QA_list_indentation_dim, labelsep = \l_QA_list_labelsep_dim, labelwidth=!, parsep=\parskip }
\renewcommand{\descriptionlabel}[1]{#1}

% The following line is mainly for the scroll mode
\setlist[itemize]{leftmargin=\maxof{\parindent}{1.5em},label=\textcolor{.!27!paper}{\raisebox{.12em}{\scriptsize$\bullet$}}}
\AddLanguageSetting
  {
    \setlist[itemize,1]{leftmargin=\maxof{\parindent}{1.5em},label=\textcolor{.!27!paper}{\raisebox{.12em}{\scriptsize$\bullet$}}}
    \setlist[itemize,2]{leftmargin=*,label=\textcolor{.!27!paper}{\rule[.2\baselineskip]{.55em}{.75pt}}}
    \setlist[itemize,3]{leftmargin=*,label=\textcolor{.!27!paper}{$\circ$}}
    \setlist[itemize,4]{leftmargin=*,label=\textcolor{.!27!paper}{$\ast$}}
  }

\setlist[enumerate,1]{label = \color{.!55!paper}\arabic*.,
    ref = \color{.!55!paper}\arabic*,
    leftmargin= \l_QA_item_indentation_dim }
\setlist[enumerate,2]{label = \color{.!55!paper}\roman*.,
    ref = \color{.!55!paper}\arabic{enumi}.\roman*}
\setlist[enumerate,3]{label = \color{.!55!paper}\emph{\alph*}.,
    ref = \color{.!55!paper}\arabic{enumi}.\roman{enumii}.\emph{\alph*}}

\dim_new:N \l_QA_labelsep_dim
\dim_set:Nn \l_QA_labelsep_dim { \labelsep }
\setlist [ 2 ] { labelsep = \l_QA_labelsep_dim, labelwidth = !}

\PassOptionsToPackage { many } { tcolorbox }
\RequirePackage { tcolorbox }
\ExplSyntaxOff
\tcbuselibrary{listings}
\ExplSyntaxOn

\tcbset{QA-common/.style={
    enhanced,
    breakable, height~fixed~for=first~and~middle,
    enlargepage~flexible=\baselineskip,
    title~after~break={\l_QA_continued_text_tl},
    center~title,
    titlerule=-1pt,
    toptitle=1mm,
    bottomtitle=-2mm,
    parbox=false,
    spread~sidewards=1mm,
    before={\vspace{-1mm}},
    after={\vspace{-1mm}},
    sharp~corners,
    frame~hidden,
    left=1em,
    right=4em,
  }
}

\tcbset{QA-additional/.style={}}
% ChatGPT style
\exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
  {
    \tcbset{QA-additional/.style={
        fontupper=\sffamily,
        code={\onehalfspacing},
        top=2em,
        bottom=2em,
      }
    }
  }

\definecolor{QA-code-keyword}{RGB}{ 47,148,210}
\definecolor{QA-code-comment}{RGB}{128,128,128}
\definecolor{QA-code-string }{RGB}{  5,165,126}
\lstalias[]{code}[LaTeX]{tex}
\lstalias[]{latex}[LaTeX]{tex}
% \lstloadlanguages{[LaTeX]TeX}
\lstset{
  basicstyle   = \small\normalfont\ttfamily,
  keywordstyle = \color{QA-code-keyword},
  commentstyle = \color{QA-code-comment},
  stringstyle  = \color{QA-code-string},
  showstringspaces = false,
}

% Based on https://tex.stackexchange.com/a/117848
\NewDocumentCommand \QAaddmoretexcs { O{common} m m }
  {%
    \lowercase{\@ifundefined{lstlang@tex$#1}}{%
      \lstloadlanguages{[#1]TeX}%
    }{}%
    \lowercase{\expandafter\g@addto@macro\csname lstlang@tex$#1\endcsname}{%
      \lstset{
        classoffset = 0,
        texcsstyle  =* \color{QA-code-keyword},
        moretexcs   = {#2}, % LaTeX2 commands
        classoffset = 1,
        texcsstyle  =* \color{cyan},
        alsoletter  = {_,:},
        moretexcs   = {#3}, % LaTeX3 commands
        classoffset = 0,
        escapeinside = {(@@@}{)}, % https://tex.stackexchange.com/q/493753
      }%
    }%
  }

% Common commands
\QAaddmoretexcs [LaTeX]
  {% LaTeX2 commands
    ExplSyntaxOn,ExplSyntaxOff,
    NewDocumentCommand,NewDocumentEnvironment,
    includegraphics,
    definecolor, colorlet, color, textcolor,
  }
  {% LaTeX3 commands
  }
% Custom commands
\QAaddmoretexcs [LaTeX]
  {% LaTeX2 commands
    UseLanguage,
    TheDate,
    SetLogoCode,
  }
  {% LaTeX3 commands
  }

\NewTCBInputListing \QAInsertCode { O{code} O{} m }
  {
    enhanced, grow~sidewards~by=1mm,
    enforce~breakable, height~fixed~for=first~and~middle,
    enlargepage~flexible=\baselineskip,
    listing~only,
    fonttitle=\scriptsize\normalfont\sffamily,
    listing~options={
      language     = #1,
      breaklines   = true,
      breakindent  = 0pt,
      % breakatwhitespace = true,
    },
    toptitle=1mm,
    bottomtitle=1mm,
    titlerule=-1pt,
    frame~hidden,
    colback=QA-code-back,
    colupper=QA-code-text,
    colbacktitle=QA-code-title-back,
    coltitle=QA-code-title-text,
    left=.75em,
    right=.75em,
    #2,
    title={#1},
    listing~file={#3},
  }

\tl_new:N \g_QA_content_tl
\NewDocumentEnvironment { QA } { +b }
  {
    \tl_gset:Nn \g_QA_content_tl { #1 }
    \QA_parse_content:N \g_QA_content_tl
    \tl_use:N \g_QA_content_tl
  }
  { }
\tl_new:N \g_QA_local_content_tl
\NewDocumentCommand \QAtext { +m }
  {
    \tl_gset:Nn \g_QA_local_content_tl { #1 }
    \QA_parse_content:N \g_QA_local_content_tl
    \tl_use:N \g_QA_local_content_tl
  }

\NewDocumentCommand \QAInput { m }
  {
    \file_get:nnN { #1 } { } \l_tmpa_tl
    \exp_args:No \QAtext { \l_tmpa_tl }
  }
\NewDocumentCommand \QAInclude { m }
  {
    \clearpage
    \QAInput { #1 }
    \clearpage
  }

\NewDocumentCommand \QAemph { m }
  {
    \textcolor{emph-text}{\textbf{ #1 }}
  }

\bool_new:N \l__QA_inside_list_bool
\bool_set_false:N \l__QA_inside_list_bool
\hook_gput_code:nnn { env/enumerate/begin } { QA }
  { \bool_set_true:N \l__QA_inside_list_bool }
\hook_gput_code:nnn { env/itemize/begin } { QA }
  { \bool_set_true:N \l__QA_inside_list_bool }
\NewDocumentCommand \QAitem { m m }
  {
    \tl_if_blank:nTF { #1 }
      {
        \begin{itemize}
          \item #2
        \end{itemize}
      }
      {
        \bool_if:NTF \l__QA_inside_list_bool
          {
            \begin{itemize}
              \item \QAemph{ #1 : } ~ \ignorespaces #2
            \end{itemize}
          }
          {
            \begin{itemize}[leftmargin=\l_QA_item_indentation_dim, labelsep=\l_QA_labelsep_dim, labelwidth=1em]
              \item \QAemph{ #1 : } ~ \ignorespaces #2
            \end{itemize}
          }
      }
  }
\NewDocumentCommand \QAenum { s m m }
  {
    \tl_if_blank:nTF { #1 }
      {
        \tl_set:Nn \l_tmpa_tl { }
      }
      {
        \tl_set:Nn \l_tmpa_tl { \QAemph{ #2 : } ~ }
      }
    \bool_if:NTF #1
      {
        \begin{enumerate}
          \item \l_tmpa_tl \ignorespaces #3
        \end{enumerate}
      }
      {
        \begin{enumerate}[resume]
          \item \l_tmpa_tl \ignorespaces #3
        \end{enumerate}
      }
  }

\NewDocumentCommand \QAnote { m }
  {
    \dim_set:Nn \l_tmpa_dim { \labelsep }
    \begin{tcolorbox}[enhanced~jigsaw, breakable,
      frame~hidden,
      interior~hidden,
      boxrule=0pt,
      grow~to~left~by=-.75mm,
      before~skip=1mm,
      after~skip=1mm,
      top=-.75mm, bottom=-.75mm, left=.33em, right=-1mm,
      borderline~west={.2em}{0pt}{QA-N-text!17!QA-N-back},
    ]
        #1
    \end{tcolorbox}
    \dim_gset:Nn \labelsep { \l_tmpa_dim }
  }

\newtcbox \QAcodebox
  {
    tcbox~raise~base,
    nobeforeafter,
    boxrule=.1pt, boxsep=1.5pt, arc=1pt,
    left=.5pt, right=.5pt, top=0pt, bottom=0pt,
    colframe=main-text!60!paper,
    colback=main-text!3!paper,
    % colupper=emph-text,
    fontupper=\small\normalfont\ttfamily,
  }
\NewDocumentCommand \QAcode { m }
  {
    % \textcolor{emph-text}{\texttt{#1}}
    \QAcodebox{\vphantom{Äpgjy}#1}
  }
\exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
  {
    \RenewDocumentCommand \QAcode { m }
      {
        \textcolor{emph-text}{\bfseries
          % {\hskip.6ex\`{}\hskip-.15ex}
          \raisebox{-.15em}{\hskip.6ex\larger\`{}\hskip-.15ex}
          % \raisebox{-.25em}{\hskip.6ex\larger[2]\`{}\hskip-.15ex}
          \texttt{ #1 }
          % {\hskip.6ex\`{}\hskip-.15ex}
          \raisebox{-.15em}{\hskip.6ex\larger\`{}\hskip-.15ex}
          % \raisebox{-.25em}{\hskip.6ex\larger[2]\`{}\hskip-.15ex}
        }
      }
  }

\NewDocumentCommand \QASepLine { O{.75pt} }
  {
    \vspace*{-.5\baselineskip}
    \noindent
    \hspace*{-\paperwidth}
    \makebox[\linewidth]{\color{QA-sep-line}\rule{4\paperwidth}{#1}}
  }

\NewDocumentEnvironment { QA_void } { } { } { }
\NewDocumentEnvironment { QA_Q } { D<>{} }
  {
    \colorlet{paper}{QA-Q-back}
    \colorlet{main-text}{QA-Q-text}
    \colorlet{emph-text}{QA-Q-emph}
    \begin{tcolorbox}[
      QA-common,
      QA-additional,
      colbacktitle={QA-Q-back},
      coltitle={QA-Q-text!33!QA-Q-back},
      colback={QA-Q-back},
      colupper={QA-Q-text},
    ]
      \exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
        { \vspace{-.5\parskip} }
      \vspace{-.5\parskip} % due to "parbox=false"
      \vspace{-\parskip}
      \begin{QA-entry}
        \exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
          { \parskip=2\parskip }
        \item[\hfill\color{QA-Q-text!33!QA-Q-back}\l_QA_logo_code_Q_tl]
  }
  {
      \end{QA-entry}
    \end{tcolorbox}
  }
\NewDocumentEnvironment { QA_A } { D<>{} }
  {
    \colorlet{paper}{QA-A-back}
    \colorlet{main-text}{QA-A-text}
    \colorlet{emph-text}{QA-A-emph}
    \begin{tcolorbox}[
      QA-common,
      QA-additional,
      colbacktitle={QA-A-back},
      coltitle={QA-A-text!33!QA-A-back},
      colback={QA-A-back},
      colupper={QA-A-text},
    ]
      \exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
        { \vspace{-.5\parskip} }
      \vspace{-.5\parskip} % due to "parbox=false"
      \vspace{-\parskip}
      \begin{QA-entry}
        \exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
          { \parskip=2\parskip }
        \item[\hfill\color{QA-A-text!33!QA-A-back}\l_QA_logo_code_A_tl]
  }
  {
      \end{QA-entry}
    \end{tcolorbox}
  }
\NewDocumentEnvironment { QA_N } { D<>{} }
  {
    \colorlet{paper}{QA-N-back}
    \colorlet{main-text}{QA-N-text}
    \colorlet{emph-text}{QA-N-emph}
    \exp_args:No \str_if_in:nnT { \l__QA_theme_str } { ChatGPT }
      {
        \colorlet{QA-code-title-back}{QA-A-back}
        \colorlet{QA-code-title-text}{QA-A-text}
      }
    \begin{tcolorbox}[
      QA-common,
      % QA-additional,
      % interior~hidden,
      colbacktitle={QA-N-back},
      coltitle={QA-N-text!33!QA-N-back},
      colback={QA-N-back},
      colupper={QA-N-text},
      fontupper=\itshape,
      left=\l_QA_list_indentation_dim+1em,
      overlay={\draw[QA-N-text!15!QA-N-back, line~width=.3em] ($(frame.north~west)+(\l_QA_list_indentation_dim+.5em,-2.75mm)$)--($(frame.south~west)+(\l_QA_list_indentation_dim+.5em,2.75mm)$);}
    ]
  }
  {
    \end{tcolorbox}
  }

\NewDocumentCommand \SetLogoCode { O{void} m }
  {
    \tl_set:cn { l_QA_logo_code_ #1 _tl } { #2 }
  }
% Set default logo code
\SetLogoCode[Q]{\textbf{\l_QA_label_Q_tl}}
\SetLogoCode[A]{\textbf{\l_QA_label_R_tl}}
\projlib_langauge_define_multilingual_text:Nn \l_QA_label_Q_tl
  {
    , EN = { Q\,: }
    , FR = { Q:   }
    , DE = { F\,: }
    , IT = { D\,: }
    , PT = { P\,: }
    , BR = { P\,: }
    , ES = { P\,: }
    , CN = { Q\,: }
    , TC = { Q\,: }
    , JP = { Q\,: }
    , RU = { B\,: }
  }
\projlib_langauge_define_multilingual_text:Nn \l_QA_label_R_tl
  {
    , EN = { A\,: }
    , FR = { R:   }
    , DE = { A\,: }
    , IT = { R\,: }
    , PT = { R\,: }
    , BR = { R\,: }
    , ES = { R\,: }
    , CN = { A\,: }
    , TC = { A\,: }
    , JP = { A\,: }
    , RU = { O\,: }
  }

\prop_new:N \g__QA_prefix_type_prop
\NewDocumentCommand \QASetTypePrefix { m m }
  {
    \clist_map_inline:nn { #2 }
      {
        \prop_gput_if_new:Nnn \g__QA_prefix_type_prop { ##1 } { #1 }
      }
  }
\NewDocumentCommand \QAAddTypePrefix { m m }
  {
    \prop_gput_if_new:Nnn \g__QA_prefix_type_prop { #2 } { #1 }
  }
\NewDocumentCommand \QARemovePrefix { m }
  {
    \prop_gremove:Nn \g__QA_prefix_type_prop { #1 }
  }
\NewDocumentCommand \QARemoveAllPrefix { }
  {
    \prop_gclear:N \g__QA_prefix_type_prop
  }

% \QASetTypePrefix { void } { VOID }
% \QASetTypePrefix { Q } { Q: , ? }
% \QASetTypePrefix { A } { A: , : }
% \QASetTypePrefix { N } { N: , " }
\QASetTypePrefix { Q } { Q: , ? , ？ }
\QASetTypePrefix { A } { A: , : , ： }
\QASetTypePrefix { N } { N: , " , “ , ” , 「 }

\AddLanguageSetting [ EN ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { Q: , ? , ？ }
    \QASetTypePrefix { A } { A: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ FR ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { Q: , ? , ？ }
    \QASetTypePrefix { A } { R: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ DE ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { F: , ? , ？ }
    \QASetTypePrefix { A } { A: , : , ： }
    \QASetTypePrefix { N } { E: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ IT ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { D: , ? , ？ }
    \QASetTypePrefix { A } { R: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ PT ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { P: , ? , ？ }
    \QASetTypePrefix { A } { R: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ BR ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { P: , ? , ？ }
    \QASetTypePrefix { A } { R: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ ES ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { P: , ? , ？ }
    \QASetTypePrefix { A } { R: , : , ： }
    \QASetTypePrefix { N } { N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ CN ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { 问： , Q: , ? , ？ }
    \QASetTypePrefix { A } { 答： , A: , : , ： }
    \QASetTypePrefix { N } { 注： , N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ TC ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { 問： , Q: , ? , ？ }
    \QASetTypePrefix { A } { 答： , A: , : , ： }
    \QASetTypePrefix { N } { 註： , N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ JP ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { Q: , ? , ？ }
    \QASetTypePrefix { A } { A: , : , ： }
    \QASetTypePrefix { N } { N: , " , 「 }
  }
\AddLanguageSetting [ RU ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { B: , ? }
    \QASetTypePrefix { A } { O: , : }
    \QASetTypePrefix { N } { P: , " }
  }

\tl_new:N \l__QA_current_type_tl
\tl_set:Nn \l__QA_current_type_tl { void }

% Parse the content
\bool_new:N \l_QA_regex_no_more_match_bool
\seq_new:N \l_QA_tmp_seq
\tl_new:N \l_QA_tmp_tl
\tl_new:N \g_QA_current_content_tl
\cs_generate_variant:Nn \regex_split:nnN { nVN }
\cs_new:Nn \QA_parse_content:N
  {
    \tl_set:Nn \l__QA_current_type_tl { void }
    \regex_split:nVN { \c{par} } #1 \l_QA_tmp_seq
    \tl_gclear:N #1
    % \tl_gclear:N \g_QA_current_content_tl
    \seq_map_inline:Nn \l_QA_tmp_seq
      {
        \tl_set:Nn \l_QA_tmp_tl { ❄️ ##1 }

        \regex_replace_all:nnN
          { \:\:\: }
          { ⚛ \c{QAInclude} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \:\: }
          { ⚛ \c{QAInput} }
          \l_QA_tmp_tl

        \regex_replace_all:nnN
          { \=\= }
          { \c{QAInsertCode} }
          \l_QA_tmp_tl

        \regex_replace_all:nnN
          { \#\#\#\#\+ }
          { ⚛ \c{subsubsection} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\#\+ }
          { ⚛ \c{subsection} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\+ }
          { ⚛ \c{section} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\#\# }
          { ⚛ \c{subsubsection}\* }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\# }
          { ⚛ \c{subsection}\* }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\# }
          { ⚛ \c{section}\* }
          \l_QA_tmp_tl

        \regex_replace_all:nnN
          { \`\` }
          { ❝ }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \` (.*?) \` }
          { \c{QAcode} {\1} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { ❝ }
          { \`\` }
          \l_QA_tmp_tl

        \regex_replace_once:nnN
          { >>> \ *? (.*) }
          { \c{QAnote} {\1} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \ *? >>> \ *? }
          { }
          \l_QA_tmp_tl

        \bool_set_false:N \l_QA_regex_no_more_match_bool
        \bool_do_until:nn \l_QA_regex_no_more_match_bool
          {
            \regex_match:nVTF { ❄️ \ *? \+{3} } \l_QA_tmp_tl
              {
                \tl_gput_right:Nn \g_QA_current_content_tl { \c_QA_enlarge_page_by_one_line_tl }
                \regex_replace_once:nnN
                  { ❄️ \ *? \+{3} (.*) }
                  { ❄️ \1 }
                  \l_QA_tmp_tl
              }
              {
                \bool_set_true:N \l_QA_regex_no_more_match_bool
              }
          }

        \tl_put_right:Nn \l_QA_tmp_tl { ❄️ }
        \regex_match:nVT { ❄️ \ *? \-{3,} \ *? ❄️ } \l_QA_tmp_tl
          {
            \regex_replace_once:nnN
              { ❄️ \ *? \-{3,} \ *? }
              { ❄️ \c{QASepLine} }
              \l_QA_tmp_tl
          }
        \regex_replace_once:nnN { ❄️ (.*) ❄️ } { ❄️ \1 } \l_QA_tmp_tl

        \prop_map_inline:Nn \g__QA_prefix_type_prop
          {
            \regex_match:nVTF { ❄️ \ *? ####1 } \l_QA_tmp_tl
              {% start of a new type
                % Put the current stored content into output stream
                \__QA_put_current_content:n { #1 }
                % Set the new type
                \tl_set:Nn \l__QA_current_type_tl { ####2 }
                \regex_replace_once:nnN
                  { ❄️ \ *? ####1 (.*) }
                  { ❄️ \1 }
                  \l_QA_tmp_tl
              }
              {% normal paragraph
                \regex_match:nVTF { ❄️ \ *? ⚛ } \l_QA_tmp_tl
                  {% Things that should be put into separate group
                    % Put the current stored content into output stream
                    \__QA_put_current_content:n { #1 }
                    % Directly put the current line into the output stream
                    \regex_replace_all:nnN { ⚛ } { } \l_QA_tmp_tl
                    \regex_replace_once:nnN { ❄️ } { } \l_QA_tmp_tl
                    \tl_gput_right:No #1 { \l_QA_tmp_tl }
                    \tl_clear:N \l_QA_tmp_tl
                  }
                  {
                    % Do nothing
                  }
              }
          }

        % \regex_replace_once:nnN
        %   { ❄️ \ *? \[\*(.*?)\] (.*) }
        %   { \c{QAitem} {\1} {\2} }
        %   \l_QA_tmp_tl
        \bool_set_false:N \l_QA_regex_no_more_match_bool
        \bool_do_until:nn \l_QA_regex_no_more_match_bool
          {
            \regex_match:nVTF { \[\*(.*?)\] (.*?) \[\* } \l_QA_tmp_tl
              {
                \regex_replace_once:nnN
                  { \[\*(.*?)\] (.*?) \[\* }
                  { \c{QAitem} {\1} {\2} \[\* }
                  \l_QA_tmp_tl
              }
              {
                \bool_set_true:N \l_QA_regex_no_more_match_bool
              }
          }
        \regex_replace_once:nnN
          { \[\*(.*?)\] (.*) }
          { \c{QAitem} {\1} {\2} }
          \l_QA_tmp_tl

        \bool_set_false:N \l_QA_regex_no_more_match_bool
        \bool_do_until:nn \l_QA_regex_no_more_match_bool
          {
            \regex_match:nVTF { 【\*(.*?)】 (.*?) 【\* } \l_QA_tmp_tl
              {
                \regex_replace_once:nnN
                  { 【\*(.*?)】 (.*?) 【\* }
                  { \c{QAitem} {\1} {\2} 【\* }
                  \l_QA_tmp_tl
              }
              {
                \bool_set_true:N \l_QA_regex_no_more_match_bool
              }
          }
        \regex_replace_once:nnN
          { 【\*(.*?)】 (.*) }
          { \c{QAitem} {\1} {\2} }
          \l_QA_tmp_tl

        \regex_replace_once:nnN
          { ❄️ \ *? \[(.*?)\] (\*?) (.*) }
          { \c{QAenum} \2 {\1} {\3} }
          \l_QA_tmp_tl
        \regex_replace_once:nnN
          { ❄️ \ *? 【(.*?)】 (\*?) (.*) }
          { \c{QAenum} \2 {\1} {\3} }
          \l_QA_tmp_tl

        \regex_replace_all:nnN
          { \*\*\* (.*?) \*\*\* }
          { \c{textbf} { \c{emph} {\1} } }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \*\* (.*?) \*\* }
          { \c{textbf} {\1} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \* (.*?) \* }
          { \c{emph} {\1} }
          \l_QA_tmp_tl

        \regex_replace_once:nnN { ❄️ } { } \l_QA_tmp_tl

        \tl_gput_right:NV \g_QA_current_content_tl \l_QA_tmp_tl
        \tl_if_empty:NF \g_QA_current_content_tl
          {
            \tl_gput_right:Nn \g_QA_current_content_tl { \par }
          }
      }
    \__QA_put_current_content:n { #1 }
  }

\box_new:N \l__QA_tmp_box
\cs_new:Nn \__QA_put_current_content:n
  {
    \tl_if_empty:NF \g_QA_current_content_tl
      {
        \tl_gput_right:Ne #1 { \exp_not:N \begin { QA_\l__QA_current_type_tl } }
        \tl_gput_right:No #1 { \g_QA_current_content_tl }
        \tl_gput_right:Ne #1 { \exp_not:N \end { QA_\l__QA_current_type_tl } }
      }
    \tl_gclear:N \g_QA_current_content_tl
  }

\bool_if:NTF \l__QA_scroll_bool
  {
    \tl_const:Nn \c_QA_enlarge_page_by_one_line_tl {}
    \geometry{
      papersize={7in,\maxdimen},
      % top=.75in,bottom=.75in,
      top=0in,bottom=0in,
      % left=.75in,right=.66in,
      left=\l_QA_list_indentation_dim+1em,right=4em,
      marginparsep=.75em,
      marginparwidth=.75in,
      footnotesep=2em plus 2pt minus 2pt,
    }
    \hook_gput_code:nnn { begindocument } { QA }
      {
        \setbox0=\vbox
        \bgroup
        \begin { QA }
      }
    \providecommand{\pdfpageheight}{\pageheight}
    \hook_gput_code:nnn { enddocument } { QA }
      {
        \end { QA }
        \egroup
        \dimen0=\dp0
        \pdfpageheight=\dimexpr\ht0\relax
        % \ifdim\pdfpageheight<10in
        %     \pdfpageheight=10in
        % \fi
        \unvbox0\kern-\dimen0
      }
  }
  {
    \tl_const:Nn \c_QA_enlarge_page_by_one_line_tl { \enlargethispage{\baselineskip} }
    \geometry{
      papersize={7in,10in},
      % top=.75in,bottom=.75in,
      top=0in,bottom=0in,
      % left=.75in,right=.66in,
      left=.75in,right=4em,
      marginparsep=.75em,
      marginparwidth=.75in,
      footnotesep=2em plus 2pt minus 2pt,
    }
    \hook_gput_code:nnn { begindocument/end } { QA }
      {
        \begin { QA }
      }
    \hook_gput_code:nnn { enddocument } { QA }
      {
        \end { QA }
      }
  }

\pagestyle { empty }

\def\textasterisk{*}
\def\textbacktick{`}
\def\textcolon{:}
\def\texteqsign{=}
\def\textsharp{\#}

\endinput
%%
%% End of file `Q-and-A.cls'.