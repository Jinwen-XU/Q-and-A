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
\NeedsTeXFormat{LaTeX2e}[2023/11/01]
\ProvidesExplClass
  {Q-and-A}
  {2023/12/19} {}
  {Document class for typesetting Q&A conversation}

\keys_define:nn { Q-and-A }
  {
    , scroll                  .bool_set:N   = \l__QA_scroll_bool
    , scroll                  .initial:n    = { false }

    , enlarge-left-margin-by  .dim_set:N    = \l__QA_extra_left_margin_dim
    , enlarge-left-margin-by  .initial:n    = { 0pt }
    , enlarge~left~margin~by  .dim_set:N    = \l__QA_extra_left_margin_dim
    , enlarge left margin by  .dim_set:N    = \l__QA_extra_left_margin_dim
    , increase-left-margin-by .dim_set:N    = \l__QA_extra_left_margin_dim
    , increase~left~margin~by .dim_set:N    = \l__QA_extra_left_margin_dim
    , increase left margin by .dim_set:N    = \l__QA_extra_left_margin_dim

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
    , ChatGPT-classical           .meta:n   = { theme = ChatGPT-classical-light }
    , ChatGPT-classical-light     .meta:n   = { theme = ChatGPT-classical-light }
    , ChatGPT-classical~light     .meta:n   = { theme = ChatGPT-classical-light }
    , ChatGPT~classical~light     .meta:n   = { theme = ChatGPT-classical-light }
    , ChatGPT classical light     .meta:n   = { theme = ChatGPT-classical-light }
    , ChatGPT-classical-dark      .meta:n   = { theme = ChatGPT-classical-dark  }
    , ChatGPT-classical~dark      .meta:n   = { theme = ChatGPT-classical-dark  }
    , ChatGPT~classical~dark      .meta:n   = { theme = ChatGPT-classical-dark  }
    , ChatGPT classical dark      .meta:n   = { theme = ChatGPT-classical-dark  }

    , numbered-question .bool_set:N         = \l__QA_numbered_question_bool
    , numbered-question .initial:n          = { false }
    , numbered~question .bool_set:N         = \l__QA_numbered_question_bool
    , numbered question .bool_set:N         = \l__QA_numbered_question_bool
    , question-number   .bool_set:N         = \l__QA_numbered_question_bool
    , question~number   .bool_set:N         = \l__QA_numbered_question_bool
    , question number   .bool_set:N         = \l__QA_numbered_question_bool

    , numbered-answer   .bool_set:N         = \l__QA_numbered_answer_bool
    , numbered-answer   .initial:n          = { false }
    , numbered~answer   .bool_set:N         = \l__QA_numbered_answer_bool
    , numbered answer   .bool_set:N         = \l__QA_numbered_answer_bool
    , answer-number     .bool_set:N         = \l__QA_numbered_answer_bool
    , answer~number     .bool_set:N         = \l__QA_numbered_answer_bool
    , answer number     .bool_set:N         = \l__QA_numbered_answer_bool

    , multiple-question .bool_set:N         = \l__QA_multiple_question_bool
    , multiple-question .initial:n          = { false }
    , multiple~question .bool_set:N         = \l__QA_multiple_question_bool
    , multiple question .bool_set:N         = \l__QA_multiple_question_bool

    , multiple-answer   .bool_set:N         = \l__QA_multiple_answer_bool
    , multiple-answer   .initial:n          = { false }
    , multiple~answer   .bool_set:N         = \l__QA_multiple_answer_bool
    , multiple answer   .bool_set:N         = \l__QA_multiple_answer_bool

    , smaller-subcounter     .bool_set:N    = \l__QA_smaller_subcounter_bool
    , smaller-subcounter     .initial:n     = { false }
    , smaller~subcounter     .bool_set:N    = \l__QA_smaller_subcounter_bool
    , smaller subcounter     .bool_set:N    = \l__QA_smaller_subcounter_bool

    , answer-outside-the-box .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer-outside-the-box .initial:n     = { false }
    , answer~outside~the~box .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer outside the box .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer-outside-box     .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer~outside~box     .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer outside box     .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer-out-of-the-box  .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer~out~of~the~box  .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer out of the box  .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer-out-of-box      .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer~out~of~box      .bool_set:N    = \l__QA_answer_outside_the_box_bool
    , answer out of box      .bool_set:N    = \l__QA_answer_outside_the_box_bool

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
\colorlet{emph-text}{QA-A-emph}

\str_if_eq:onT { \l__QA_theme_str } { ChatGPT-dark }
  {
    \definecolor{QA-code-title-back}{RGB}{ 32, 33, 35}
    \definecolor{QA-Q-back}{RGB}{ 52, 53, 65}
    \definecolor{QA-Q-text}{RGB}{236,236,241}
    \definecolor{QA-Q-emph}{RGB}{255,255,255}
    \colorlet{QA-A-back}{QA-Q-back}
    \colorlet{QA-A-text}{QA-Q-text}
    \colorlet{QA-A-emph}{QA-Q-emph}
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
    \colorlet{QA-A-back}{QA-Q-back}
    \colorlet{QA-A-text}{QA-Q-text}
    \colorlet{QA-A-emph}{QA-Q-emph}
    \colorlet{QA-N-back}{QA-Q-back}
    \colorlet{QA-N-text}{QA-Q-text}
    \colorlet{paper}{QA-Q-back}
    \colorlet{main-text}{QA-Q-text}
    \colorlet{emph-text}{QA-Q-text}
  }

\str_if_eq:onT { \l__QA_theme_str } { ChatGPT-classical-dark }
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

\str_if_eq:onT { \l__QA_theme_str } { ChatGPT-classical-light }
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
\dim_set:Nn \l_QA_list_indentation_dim { 3em + \l__QA_extra_left_margin_dim }
\dim_new:N \l_QA_list_labelsep_dim
\dim_set:Nn \l_QA_list_labelsep_dim { 1em }

\str_if_in:NnT \l__QA_theme_str { ChatGPT }
  {
    \dim_set:Nn \l_QA_item_indentation_dim { .33em }
    \dim_set:Nn \l_QA_list_indentation_dim { 4.5em + \l__QA_extra_left_margin_dim }
    \dim_set:Nn \l_QA_list_labelsep_dim { 1.5em }
  }

\newlist { QA-entry } { description } { 1 }
\setlist [ QA-entry ] { font = \normalfont\sffamily, leftmargin = \l_QA_list_indentation_dim, labelsep = \l_QA_list_labelsep_dim, labelwidth=10em, itemindent=0pt, parsep=\parskip }
\renewcommand{\descriptionlabel}[1]{#1}

\bool_new:N \l__QA_inside_list_bool
\bool_set_false:N \l__QA_inside_list_bool
\hook_gput_code:nnn { env/enumerate/begin } { QA }
  { \bool_set_true:N \l__QA_inside_list_bool }
% \hook_gput_code:nnn { env/QA-em-itemize/begin } { QA }
%   { \bool_set_true:N \l__QA_inside_list_bool }

\tl_new:N \l__QA_item_indentation_tl
\tl_set:Nn \l__QA_item_indentation_tl
  {
    \bool_if:NTF \l__QA_inside_list_bool
      { 1.5em }
      { \l_QA_item_indentation_dim }
  }

\newlist { QA-em-itemize } { itemize } { 1 }
\setlist[QA-em-itemize,1]{
  leftmargin= \l__QA_item_indentation_tl, labelwidth=1em,
  label=\textcolor{.!27!paper}{\raisebox{.12em}{\scriptsize$\bullet$}}}
% \setlist[QA-em-itemize,1]{
%   leftmargin= \l_QA_item_indentation_dim, labelwidth=1em,
%   label=\textcolor{.!27!paper}{$\bullet$}}

% The following line is mainly for the scroll mode
\setlist[itemize]{
  leftmargin= \l__QA_item_indentation_tl, labelwidth=1em,
  label=\textcolor{.!27!paper}{\raisebox{.12em}{\scriptsize$\bullet$}}}
\AddLanguageSetting
  {
    \setlist[itemize,1]{
      leftmargin= \l__QA_item_indentation_tl, labelwidth=1em,
      label=\textcolor{.!27!paper}{\raisebox{.12em}{\scriptsize$\bullet$}}}
    \setlist[itemize,2]{
      leftmargin= 1.5em,
      label=\textcolor{.!27!paper}{\rule[.2\baselineskip]{.55em}{.75pt}}}
    \setlist[itemize,3]{leftmargin=*,label=\textcolor{.!27!paper}{$\circ$}}
    \setlist[itemize,4]{leftmargin=*,label=\textcolor{.!27!paper}{$\ast$}}
  }
\AddLanguageSetting [ FR ]
  {
    \setlist[itemize,1]{%leftmargin=\maxof{\parindent}{1.5em},
      leftmargin= \l__QA_item_indentation_tl, labelwidth=1em,
      label=\textcolor{.!39!paper}{\rule[.2\baselineskip]{.8em}{.75pt}}}
  }
\AddLanguageSetting [ ES ]
  {
    \setlist[itemize,1]{%leftmargin=\maxof{\parindent}{1.5em},
      leftmargin= \l__QA_item_indentation_tl, labelwidth=1em,
      label=\textcolor{.!27!paper}{
        \leavevmode\hbox to 1.2ex{\hss\vrule height .9ex width .7ex depth -.2ex\hss}
      }}
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
    top=1em,
    bottom=1em,
    left=1em,
    right=4em,
  }
}

\tcbset{QA-additional/.style={}}
% ChatGPT style
\str_if_in:NnT \l__QA_theme_str { ChatGPT }
  {
    \tcbset{QA-additional/.style={
        fontupper=\sffamily,
        code={\onehalfspacing},
        top=1.5em,
        bottom=1.5em,
      }
    }
  }
\str_if_in:NnT \l__QA_theme_str { ChatGPT-classical }
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
\lstdefinelanguage{plaintext}{}
\lstdefinelanguage{Markdown}{
  keywords={
    \#,\#\#,\#\#\#,\#\#\#\#,\#\#\#\#\#,\#\#\#\#\#\#,
    >,
    ---,----,-----,------,-------,--------,---------,
  },
  alsoletter={\#,>,*,-,`},
  moredelim=[s][\color{QA-code-string}\ttfamily]{`}{`},
  moredelim=[s][\itshape]{*}{*},
  moredelim=[s][\bfseries]{**}{**},
  moredelim=[s][\bfseries\itshape]{***}{***},
  morecomment=[s]{<!--}{-->},
  sensitive=true
}
\lstdefinelanguage{JavaScript}{% https://tex.stackexchange.com/q/89574
  keywords={abstract, any, as, boolean, break, case, catch, class, console,
    const, continue, debugger, declare, default, delete, do, else, enum, export,
    extends, false, finally, for, from, function, get, if, implements, import, in,
    infer, instanceof, interface, keyof, let, module, namespace, never, new, null,
    number, object, package, private, protected, public, readonly, require, return,
    set, static, string, super, switch, symbol, this, throw, true, try, type, typeof,
    undefined, unique, unknown, var, void, while, with, yield},
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  sensitive=true
}
\lstalias[]{txt}[]{plaintext}
\lstalias[]{code}[LaTeX]{tex}
\lstalias[]{latex}[LaTeX]{tex}
\lstalias[]{Csharp}[Sharp]{C}
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
    tikz, draw, fill, filldraw, node, clip,
    smaller,larger,
  }
  {% LaTeX3 commands
  }
% Custom commands
\QAaddmoretexcs [LaTeX]
  {% LaTeX2 commands
    UseLanguage,
    TheDate,
    SetLogoCode,
    SetSubcounterStyle,
    SetSubcounterSeparator,
    EnableMultipleQuestion,
    EnableMultipleAnswer,
    DisableMultipleQuestion,
    DisableMultipleAnswer,
    QALabel, QARef,
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
\NewDocumentEnvironment { Q-and-A } { +b }
  {
    \tl_gset:Nn \g_QA_content_tl { #1 }
    \QA_parse_content:N \g_QA_content_tl
    \tl_use:N \g_QA_content_tl
  }
  { }
\tl_new:N \g_QA_local_content_tl
\NewDocumentCommand \QAtext { +m }
  {
    \group_begin:
    \tl_gset:Nn \g_QA_local_content_tl { #1 }
    \QA_parse_content:N \g_QA_local_content_tl
    \tl_use:N \g_QA_local_content_tl
    \group_end:
  }

\def\QAendmark{}
\NewDocumentCommand \QAInput { m }
  {
    \file_get:nnN { #1 } { } \l_tmpa_tl
    \exp_args:No \QAtext { \l_tmpa_tl }
    % Currently, for some reason, the following adjustment is needed
    \peek_regex:nF { (\ *)? (\c{par}*)? (\ *)? \c{QAendmark} }
      {
        \peek_meaning:NF \QAendmark
          {% only do this in the middle of the text
            \vspace{-2\parskip}
          }
      }
  }
\NewDocumentCommand \QAInclude { m }
  {
    \clearpage
    \QAInput { #1 }
    \clearpage
  }

\NewDocumentCommand \QAEmph { m }
  {
    \textcolor{emph-text}{\textbf{ #1 }}
  }

\def \QAadjustitem { \vspace{0pt} }
\NewDocumentCommand \QAItem { m m }
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
              \item \QAEmph{ \ignorespaces #1 : } ~ \ignorespaces #2
            \end{itemize}
          }
          {
            \begin{QA-em-itemize}
              \bool_set_true:N \l__QA_inside_list_bool
              \item \QAEmph{ \ignorespaces #1 : } ~ \ignorespaces #2
            \end{QA-em-itemize}
            % \bool_set_true:N \l__QA_inside_list_bool
          }
      }
  }
\NewDocumentCommand \QAEnum { s m m }
  {
    \tl_if_blank:nTF { #2 }
      {
        \tl_set:Nn \l_tmpa_tl { }
      }
      {
        \tl_set:Nn \l_tmpa_tl { \QAEmph{ #2 : } ~ }
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

\NewDocumentCommand \QANote { m }
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
    \vspace{.15\baselineskip}
    \dim_gset:Nn \labelsep { \l_tmpa_dim }
  }

\property_new:nnnn { Q-and-A/type } { now } { void } { \l__QA_current_type_tl }
\NewDocumentCommand \QALabel { m }
  {
    \group_begin:
    \exp_args:No \addtocounter { QA_ \l__QA_current_type_tl } { -1 }
    \exp_args:No \refstepcounter { QA_ \l__QA_current_type_tl }
    \property_record:nn { #1 } { label, target, Q-and-A/type }
    \group_end:
  }

\tl_new:N \l_QA_Q_ref_style_tl
\tl_new:N \l_QA_A_ref_style_tl
\NewDocumentCommand \QASetRefStyle { O{void} m }
  {
    \tl_set:cn { l_QA_ #1 _ref_style_tl } { #2 }
  }
\NewCommandCopy \SetRefStyle \QASetRefStyle

\QASetRefStyle[Q]
  {
    \sffamily\bfseries
    \color{QA-Q-text!33!QA-Q-back}
  }
\QASetRefStyle[A]
  {
    \sffamily\bfseries
    \color{QA-A-text!33!QA-A-back}
  }

\NewDocumentCommand \QARef { m }
  {
    \group_begin:
    \hyperlink { \property_ref:nn { #1 } { target } }
      {
        \cs_if_exist_use:c { l_QA_ \property_ref:nn { #1 } { Q-and-A/type } _ref_style_tl }
        \cs_if_exist_use:c { l_QA_ \property_ref:nn { #1 } { Q-and-A/type } _label_text_tl }
        \QA_show_subcounter_with_style:n { \property_ref:nn { #1 } { label } }
      }
    \group_end:
  }

\NewDocumentCommand \QASection { m }
  {
    \par\medskip\smallskip
    \textbf{\larger[1.5]#1}
    \par\smallskip
  }
\NewDocumentCommand \QASubSection { m }
  {
    \par\medskip
    \textbf{\larger#1}
    \par\smallskip
  }
\NewDocumentCommand \QASubSubSection { m }
  {
    \par\smallskip
    \textbf{#1}
    \par\smallskip
  }

\newenvironment{QACompactCenter}
  {\parskip=0pt\par\nopagebreak\centering}
  {\par\noindent\ignorespacesafterend}
\newenvironment{QACenter}
  {\parskip=0pt\par\medskip\nopagebreak\centering}
  {\par\noindent\ignorespacesafterend}
\newenvironment{QALeft}
  {\parskip=0pt\par\medskip\nopagebreak\raggedright}
  {\par\noindent\ignorespacesafterend}
\newenvironment{QARight}
  {\parskip=0pt\par\medskip\nopagebreak\raggedleft}
  {\par\noindent\ignorespacesafterend}

\NewDocumentCommand \QACaption { m } { }
\NewDocumentCommand \QASetCaptionStyle { m }
  {
    \RenewDocumentCommand \QACaption { m }
      {
        \begin{QACompactCenter}
          #1
        \end{QACompactCenter}
      }
  }
\NewCommandCopy \SetCaptionStyle \QASetCaptionStyle
\QASetCaptionStyle { #1 }

\NewDocumentCommand \QAShowImageCenter { D<>{*} m D<>{*} }
  {
    \str_if_eq:nnTF { #1 } { * }
      {
        \str_if_eq:nnTF { #3 } { * }
          {
            \tl_set:Nn \l_tmpa_tl { 1 }
          }
          {
            \tl_set:Nn \l_tmpa_tl { #3 }
          }
      }
      {
        \tl_set:Nn \l_tmpa_tl { #1 }
      }
    \begin{QACenter}
      \includegraphics[width= \tl_use:N \l_tmpa_tl \linewidth]{#2}
    \end{QACenter}
  }
\NewDocumentCommand \QAShowImageLeft { D<>{*} m D<>{*} }
  {
    \str_if_eq:nnTF { #1 } { * }
      {
        \str_if_eq:nnTF { #3 } { * }
          {
            \tl_set:Nn \l_tmpa_tl { 1 }
          }
          {
            \tl_set:Nn \l_tmpa_tl { #3 }
          }
      }
      {
        \tl_set:Nn \l_tmpa_tl { #1 }
      }
    \begin{QALeft}
      \includegraphics[width= \tl_use:N \l_tmpa_tl \linewidth]{#2}
    \end{QALeft}
  }
\NewDocumentCommand \QAShowImageRight { D<>{*} m D<>{*} }
  {
    \str_if_eq:nnTF { #1 } { * }
      {
        \str_if_eq:nnTF { #3 } { * }
          {
            \tl_set:Nn \l_tmpa_tl { 1 }
          }
          {
            \tl_set:Nn \l_tmpa_tl { #3 }
          }
      }
      {
        \tl_set:Nn \l_tmpa_tl { #1 }
      }
    \begin{QARight}
      \includegraphics[width= \tl_use:N \l_tmpa_tl \linewidth]{#2}
    \end{QARight}
  }

\newtcbox \QACodebox
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
\NewDocumentCommand \QACode { m }
  {
    % \textcolor{emph-text}{\texttt{#1}}
    \QACodebox{\vphantom{Äpgjy}#1}
  }
\str_if_in:NnT \l__QA_theme_str { ChatGPT }
  {
    \RenewDocumentCommand \QACode { m }
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
    \par
    \vspace*{-.5\baselineskip}
    \noindent
    \hspace*{-\paperwidth}
    \makebox[\linewidth]{\color{QA-sep-line}\rule{4\paperwidth}{#1}}
    \par
  }

\NewDocumentEnvironment { QA_void } { } { } { }

\str_new:N \g__QA_Q_name_str
\NewDocumentEnvironment { QA_Q } { D<>{} }
  {
    \tl_set:Nn \l__QA_current_type_tl { Q }
    \str_if_empty:nF { #1 }
      {
        \str_gset:Nn \g__QA_Q_name_str { #1 }
      }
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
      \str_if_in:NnT \l__QA_theme_str { ChatGPT }
        { \vspace{-.5\parskip} }
      \vspace{-.5\parskip} % due to "parbox=false"
      \vspace{-\parskip}
      \begin{QA-entry}
        \str_if_in:NnT \l__QA_theme_str { ChatGPT }
          { \parskip=2\parskip }
        \item[\hfill\color{QA-Q-text!33!QA-Q-back}\l_QA_Q_logo_code_tl]
        \str_case:NnT \l__QA_theme_str
          {
            { ChatGPT-dark  } {}
            { ChatGPT-light } {}
          }
          {
            \str_if_empty:NF \g__QA_Q_name_str
              {
                \textbf{ \g__QA_Q_name_str }\\
              }
          }
  }
  {
      \end{QA-entry}
    \end{tcolorbox}
  }

\str_new:N \g__QA_A_name_str
\NewDocumentEnvironment { QA_A } { D<>{} }
  {
    \tl_set:Nn \l__QA_current_type_tl { A }
    \str_if_empty:nF { #1 }
      {
        \str_gset:Nn \g__QA_A_name_str { #1 }
      }
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
      \str_if_in:NnT \l__QA_theme_str { ChatGPT }
        { \vspace{-.5\parskip} }
      \vspace{-.5\parskip} % due to "parbox=false"
      \vspace{-\parskip}
      \begin{QA-entry}
        \str_if_in:NnT \l__QA_theme_str { ChatGPT }
          { \parskip=2\parskip }
        \item[\hfill\color{QA-A-text!33!QA-A-back}\l_QA_A_logo_code_tl]
        \str_case:NnT \l__QA_theme_str
          {
            { ChatGPT-dark  } {}
            { ChatGPT-light } {}
          }
          {
            \str_if_empty:NF \g__QA_A_name_str
              {
                \textbf{ \g__QA_A_name_str }\\
              }
          }
  }
  {
      \end{QA-entry}
    \end{tcolorbox}
  }
\NewDocumentEnvironment { QA_N } { D<>{} }
  {
    \tl_set:Nn \l__QA_current_type_tl { N }
    \colorlet{paper}{QA-N-back}
    \colorlet{main-text}{QA-N-text}
    \colorlet{emph-text}{QA-N-emph}
    \str_if_in:NnT \l__QA_theme_str { ChatGPT-classical }
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

\bool_if:NT \l__QA_answer_outside_the_box_bool
  {
    \colorlet{paper}{QA-A-back}
    \colorlet{main-text}{QA-A-text}
    \colorlet{emph-text}{QA-A-emph}

    \projlib_paper_set_page_color:n { paper }
    \projlib_paper_set_text_color:n { main-text }

    \RenewDocumentEnvironment { QA_A } { D<>{} }
      {
        \tl_set:Nn \l__QA_current_type_tl { A }
        \str_if_empty:nF { #1 }
          {
            \str_gset:Nn \g__QA_A_name_str { #1 }
          }
        \color{QA-A-text}
        \vspace*{1em}
        \str_if_in:NnT \l__QA_theme_str { ChatGPT }
          { \vspace{.5em} }
        \str_if_in:NnT \l__QA_theme_str { ChatGPT-classical }
          { \vspace{.5em} }
        \str_if_in:NnT \l__QA_theme_str { ChatGPT }
          {
            \sffamily
            \onehalfspacing
            \vspace{-.5\parskip}
          }
        \vspace{-.5\parskip}
        \begin{QA-entry}[leftmargin=.5mm, itemindent=0pt, labelsep=\l_QA_list_labelsep_dim, labelwidth=3em]
          \str_if_in:NnT \l__QA_theme_str { ChatGPT }
            { \parskip=2\parskip }
          \item[\hfill\color{QA-A-text!33!QA-A-back}\l_QA_A_logo_code_tl]
          \str_case:NnT \l__QA_theme_str
            {
              { ChatGPT-dark  } {}
              { ChatGPT-light } {}
            }
            {
              \str_if_empty:NF \g__QA_A_name_str
                {
                  \textbf{ \g__QA_A_name_str }\\
                }
            }
      }
      {
        \end{QA-entry}
        \vspace{1em}
        \str_if_in:NnT \l__QA_theme_str { ChatGPT }
          { \vspace{.5em} }
        \str_if_in:NnT \l__QA_theme_str { ChatGPT-classical }
          { \vspace{.5em} }
      }
  }

\NewDocumentCommand \QASetLogoCode { O{void} m }
  {
    \tl_set:cn { l_QA_ #1 _logo_code_tl } { #2 }
  }
\NewCommandCopy \SetLogoCode \QASetLogoCode

% Set default logo code
\SetLogoCode[Q]{\textbf{\l_QA_Q_label_tl}}
\SetLogoCode[A]{\textbf{\l_QA_A_label_tl}}

\newcounter{QA_Q}
\newcounter{QA_A}

\def\QASubcounterStyle{}
\def\QASubcounterSeparator{.}
\NewDocumentCommand \QASetSubcounterStyle { m }
  {
    \def\QASubcounterStyle{#1}
  }
\NewCommandCopy \SetSubcounterStyle \QASetSubcounterStyle
\NewDocumentCommand \QASetSubcounterSeparator { m }
  {
    \def\QASubcounterSeparator{#1}
  }
\NewCommandCopy \SetSubcounterSeparator \QASetSubcounterSeparator

\bool_if:NT \l__QA_smaller_subcounter_bool
  {
    \QASetSubcounterStyle{\smaller}
  }

\cs_new_protected:Nn \QA_show_subcounter_with_style:n
  {
    \group_begin:
    \tl_set:Nx \l_tmpa_tl { #1 }
    \regex_replace_once:nnN { \. (.*) } { \c{QASubcounterStyle}{\c{QASubcounterSeparator}\1} } \l_tmpa_tl
    \tl_use:N \l_tmpa_tl
    \group_end:
  }
\NewDocumentCommand \QAShowCounter { m }
  {
    \refstepcounter{QA_#1}
    \QA_show_subcounter_with_style:n { \cs_if_exist_use:c {theQA_#1} }
  }

\newcounter{QA_Q_aux}
\newcounter{QA_A_aux}

\bool_new:N \g__QA_Q_multiple_counter_already_enabled_bool
\bool_new:N \g__QA_Q_multiple_counter_already_updated_bool
\bool_gset_false:N \g__QA_Q_multiple_counter_already_enabled_bool
\NewDocumentCommand \EnableMultipleQuestion { }
  {
    \hook_gput_next_code:nn { env/QA_Q/before } { \__QA_Q_multiple_enable_core: }
  }
\cs_new:Nn \__QA_Q_multiple_enable_core:
  {
    \bool_if:NF \g__QA_Q_multiple_counter_already_enabled_bool
      {
        \setcounter{QA_Q_aux}{\value{QA_Q}} % set the outer counter
        \addtocounter{QA_Q_aux}{1}
        \setcounter{QA_Q}{0} % reset the inner counter
        \counterwithin{QA_Q}{QA_Q_aux}
        \hook_gput_code:nnn { env/QA_Q/begin } { Q-and-A-multi-Q }
          {
            \bool_gset_false:N \g__QA_Q_multiple_counter_already_updated_bool
          }
        \hook_gput_code:nnn { env/QA_A/begin } { Q-and-A-multi-Q }
          {
            \bool_if:NF \g__QA_Q_multiple_counter_already_updated_bool
              {
                \stepcounter{QA_Q_aux}
              }
            \bool_gset_true:N \g__QA_Q_multiple_counter_already_updated_bool
          }
      }
    \bool_gset_true:N \g__QA_Q_multiple_counter_already_enabled_bool
  }
\NewDocumentCommand \DisableMultipleQuestion { }
  {
    \hook_gput_next_code:nn { env/QA_Q/before } { \__QA_Q_multiple_disable_core: }
  }
\cs_new:Nn \__QA_Q_multiple_disable_core:
  {
    \bool_if:NT \g__QA_Q_multiple_counter_already_enabled_bool
      {
        \counterwithout{QA_Q}{QA_Q_aux}
        \setcounter{QA_Q}{\value{QA_Q_aux}} % set the outer counter
        \addtocounter{QA_Q}{-1}
        \hook_gremove_code:nn { env/QA_Q/begin } { Q-and-A-multi-Q }
        \hook_gremove_code:nn { env/QA_A/begin } { Q-and-A-multi-Q }
      }
    \bool_gset_false:N \g__QA_Q_multiple_counter_already_enabled_bool
  }

\bool_new:N \g__QA_A_multiple_counter_already_enabled_bool
\bool_new:N \g__QA_A_multiple_counter_already_updated_bool
\bool_gset_false:N \g__QA_A_multiple_counter_already_enabled_bool
\NewDocumentCommand \EnableMultipleAnswer { }
  {
    \hook_gput_next_code:nn { env/QA_A/before } { \__QA_A_multiple_enable_core: }
  }
\cs_new:Nn \__QA_A_multiple_enable_core:
  {
    \bool_if:NF \g__QA_A_multiple_counter_already_enabled_bool
      {
        \setcounter{QA_A_aux}{\value{QA_A}} % set the outer counter
        \addtocounter{QA_A_aux}{1}
        \setcounter{QA_A}{0} % reset the inner counter
        \counterwithin{QA_A}{QA_A_aux}
        \hook_gput_code:nnn { env/QA_A/begin } { Q-and-A-multi-A }
          {
            \bool_gset_false:N \g__QA_A_multiple_counter_already_updated_bool
          }
        \hook_gput_code:nnn { env/QA_Q/begin } { Q-and-A-multi-A }
          {
            \bool_if:NF \g__QA_A_multiple_counter_already_updated_bool
              {
                \stepcounter{QA_A_aux}
              }
            \bool_gset_true:N \g__QA_A_multiple_counter_already_updated_bool
          }
      }
    \bool_gset_true:N \g__QA_A_multiple_counter_already_enabled_bool
  }
\NewDocumentCommand \DisableMultipleAnswer { }
  {
    \hook_gput_next_code:nn { env/QA_A/before } { \__QA_A_multiple_disable_core: }
  }
\cs_new:Nn \__QA_A_multiple_disable_core:
  {
    \bool_if:NT \g__QA_A_multiple_counter_already_enabled_bool
      {
        \counterwithout{QA_A}{QA_A_aux}
        \setcounter{QA_A}{\value{QA_A_aux}} % set the outer counter
        \addtocounter{QA_A}{-1}
        \hook_gremove_code:nn { env/QA_A/begin } { Q-and-A-multi-A }
        \hook_gremove_code:nn { env/QA_Q/begin } { Q-and-A-multi-A }
      }
    \bool_gset_false:N \g__QA_A_multiple_counter_already_enabled_bool
  }

\bool_if:NT \l__QA_multiple_question_bool { \EnableMultipleQuestion }
\bool_if:NT \l__QA_multiple_answer_bool   { \EnableMultipleAnswer   }

\projlib_langauge_define_multilingual_text:Nn \l_QA_Q_label_text_tl
  {
    , EN = { Q }
    , FR = { Q }
    , DE = { F }
    , IT = { D }
    , PT = { P }
    , BR = { P }
    , ES = { P }
    , CN = { 问 }
    , TC = { 問 }
    , JP = { Q }
    , RU = { B }
  }
\bool_if:NTF \l__QA_numbered_question_bool
  {
    \projlib_langauge_define_multilingual_text:Nn \l_QA_Q_label_tl
      {
        , EN = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , FR = { \l_QA_Q_label_text_tl \QAShowCounter{Q} :   }
        , DE = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , IT = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , PT = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , BR = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , ES = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , CN = { \l_QA_Q_label_text_tl \, \QAShowCounter{Q} \,：\hspace{-.5em} }
        , TC = { \l_QA_Q_label_text_tl \, \QAShowCounter{Q} \,：\hspace{-.5em} }
        , JP = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
        , RU = { \l_QA_Q_label_text_tl \QAShowCounter{Q} \,: }
      }
  }
  {
    \projlib_langauge_define_multilingual_text:Nn \l_QA_Q_label_tl
      {
        , EN = { \l_QA_Q_label_text_tl \,: }
        , FR = { \l_QA_Q_label_text_tl :   }
        , DE = { \l_QA_Q_label_text_tl \,: }
        , IT = { \l_QA_Q_label_text_tl \,: }
        , PT = { \l_QA_Q_label_text_tl \,: }
        , BR = { \l_QA_Q_label_text_tl \,: }
        , ES = { \l_QA_Q_label_text_tl \,: }
        , CN = { \l_QA_Q_label_text_tl \,：\hspace{-.33em} }
        , TC = { \l_QA_Q_label_text_tl \,：\hspace{-.33em} }
        , JP = { \l_QA_Q_label_text_tl \,: }
        , RU = { \l_QA_Q_label_text_tl \,: }
      }
  }
\projlib_langauge_define_multilingual_text:Nn \l_QA_A_label_text_tl
  {
    , EN = { A }
    , FR = { R }
    , DE = { A }
    , IT = { R }
    , PT = { R }
    , BR = { R }
    , ES = { R }
    , CN = { 答 }
    , TC = { 答 }
    , JP = { A }
    , RU = { O }
  }
\bool_if:NTF \l__QA_numbered_answer_bool
  {
    \projlib_langauge_define_multilingual_text:Nn \l_QA_A_label_tl
      {
        , EN = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , FR = { \l_QA_A_label_text_tl \QAShowCounter{A} :   }
        , DE = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , IT = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , PT = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , BR = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , ES = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , CN = { \l_QA_A_label_text_tl \, \QAShowCounter{A} \,：\hspace{-.5em} }
        , TC = { \l_QA_A_label_text_tl \, \QAShowCounter{A} \,：\hspace{-.5em} }
        , JP = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
        , RU = { \l_QA_A_label_text_tl \QAShowCounter{A} \,: }
      }
  }
  {
    \projlib_langauge_define_multilingual_text:Nn \l_QA_A_label_tl
      {
        , EN = { \l_QA_A_label_text_tl \,: }
        , FR = { \l_QA_A_label_text_tl :   }
        , DE = { \l_QA_A_label_text_tl \,: }
        , IT = { \l_QA_A_label_text_tl \,: }
        , PT = { \l_QA_A_label_text_tl \,: }
        , BR = { \l_QA_A_label_text_tl \,: }
        , ES = { \l_QA_A_label_text_tl \,: }
        , CN = { \l_QA_A_label_text_tl \,：\hspace{-.33em} }
        , TC = { \l_QA_A_label_text_tl \,：\hspace{-.33em} }
        , JP = { \l_QA_A_label_text_tl \,: }
        , RU = { \l_QA_A_label_text_tl \,: }
      }
  }

\prop_new:N \g__QA_prefix_type_prop
\NewDocumentCommand \QASetTypePrefix { m m }
  {
    \clist_map_inline:nn { #2 }
      {
        \prop_gput_if_new:Nnn \g__QA_prefix_type_prop { ##1 } { #1 }
      }
  }
\NewCommandCopy \SetTypePrefix \QASetTypePrefix
\NewDocumentCommand \QAAddTypePrefix { m m }
  {
    \prop_gput_if_new:Nnn \g__QA_prefix_type_prop { #2 } { #1 }
  }
\NewCommandCopy \AddTypePrefix \QAAddTypePrefix
\NewDocumentCommand \QARemovePrefix { m }
  {
    \prop_gremove:Nn \g__QA_prefix_type_prop { #1 }
  }
\NewCommandCopy \RemovePrefix \QARemovePrefix
\NewDocumentCommand \QARemoveAllPrefix { }
  {
    \prop_gclear:N \g__QA_prefix_type_prop
  }
\NewCommandCopy \RemoveAllPrefix \QARemoveAllPrefix

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
    \QASetTypePrefix { Q } { 问： , 问: , Q: , ? , ？ }
    \QASetTypePrefix { A } { 答： , 答: , A: , : , ： }
    \QASetTypePrefix { N } { 注： , 注: , N: , " , “ , ” , 「 }
  }
\AddLanguageSetting [ TC ]
  {
    \QARemoveAllPrefix
    \QASetTypePrefix { Q } { 問： , 問: , Q: , ? , ？ }
    \QASetTypePrefix { A } { 答： , 答: , A: , : , ： }
    \QASetTypePrefix { N } { 註： , 註: , N: , " , “ , ” , 「 }
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
% https://tex.stackexchange.com/a/703640
\cs_new:Nn \QA_regex_replace_case_once_skip_math:nN
  {
    \regex_replace_case_once:nN
      {
        { \$ (.*?) \$ } { \0 }
        { \c{\(} (.*?) \c{\)} } { \0 }
        { \c{\[} (.*?) \c{\]} } { \0 }
        #1
      } #2
  }
\cs_new:Nn \QA_regex_replace_case_all_skip_math:nN
  {
    \regex_replace_case_all:nN
      {
        { \$ (.*?) \$ } { \0 }
        { \c{\(} (.*?) \c{\)} } { \0 }
        { \c{\[} (.*?) \c{\]} } { \0 }
        #1
      } #2
  }
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
          { \#\#\#\#\- }
          { ⚛ \c{subsubsection}\* }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\#\- }
          { ⚛ \c{subsection}\* }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\- }
          { ⚛ \c{section}\* }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\#\# }
          { \c{QASubSubSection} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\#\# }
          { \c{QASubSection} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \#\# }
          { \c{QASection} }
          \l_QA_tmp_tl

        \regex_replace_all:nnN
          { \`\` }
          { ❝ }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \` (.*?) \` }
          { \c{QACode} {\1} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { ❝ }
          { \`\` }
          \l_QA_tmp_tl

        \regex_replace_once:nnN
          { >>> \ *? (.*) }
          { \c{QANote} {\1} }
          \l_QA_tmp_tl
        \regex_replace_all:nnN
          { \ *? >>> \ *? }
          { }
          \l_QA_tmp_tl

        \exp_args:Nno \regex_split:nnN { >> } { \l_QA_tmp_tl } \l_tmpa_seq
        \seq_pop_left:NN \l_tmpa_seq \l_tmpa_tl
        \tl_set_eq:NN \l_QA_tmp_tl \l_tmpa_tl
        \seq_map_inline:Nn \l_tmpa_seq
          {
            \tl_put_right:Nn \l_QA_tmp_tl
              { \QACaption { ####1 } }
          }

        % \regex_replace_all:nnN
        %   { \|\| }
        %   { \c{QAShowImageCenter} }
        %   \l_QA_tmp_tl
        % \regex_replace_all:nnN
        %   { \(\( }
        %   { \c{QAShowImageLeft} }
        %   \l_QA_tmp_tl
        % \regex_replace_all:nnN
        %   { \)\) }
        %   { \c{QAShowImageRight} }
        %   \l_QA_tmp_tl
        \QA_regex_replace_case_all_skip_math:nN
          {
            { \|\| } { \c{QAShowImageCenter} }
            { \(\( } { \c{QAShowImageLeft} }
            { \)\) } { \c{QAShowImageRight} }
          } \l_QA_tmp_tl

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
                    \tl_gput_right:No #1 { \l_QA_tmp_tl \par }
                    \tl_clear:N \l_QA_tmp_tl
                    % Reset the current type (!!this certainly breaks the usual behavior of \input and \include!!)
                    \tl_set:Nn \l__QA_current_type_tl { void }
                  }
                  {
                    % Do nothing
                  }
              }
          }

        %% Process the first and wrap the others inside
        \regex_replace_once:nnN
          { ❄️ \ *? \[\*(.*?)\] (.*) }
          { \c{QAItem} {\1} {\2} }
          \l_QA_tmp_tl
        %% Process the middle ones
        \bool_set_false:N \l_QA_regex_no_more_match_bool
        \bool_do_until:nn \l_QA_regex_no_more_match_bool
          {
            \regex_match:nVTF { \[\*(.*?)\] (.*?) \[\* } \l_QA_tmp_tl
              {
                \regex_replace_once:nnN
                  { \[\*(.*?)\] (.*?) \[\* }
                  { \c{QAItem} {\1} {\2} \c{QAadjustitem} \[\* }
                  \l_QA_tmp_tl
              }
              {
                \bool_set_true:N \l_QA_regex_no_more_match_bool
              }
          }
        %% Process the last one
        \regex_replace_once:nnN
          { \[\*(.*?)\] (.*) }
          { \c{QAItem} {\1} {\2} }
          \l_QA_tmp_tl

        \regex_replace_once:nnN
          { ❄️ \ *? \[(.*?)\] (\*?) (.*) }
          { \c{QAEnum} \2 {\1} {\3} }
          \l_QA_tmp_tl

        % \regex_replace_all:nnN
        %   { \*\*\* (.*?) \*\*\* }
        %   { \c{QAEmph} { \c{emph} {\1} } }
        %   \l_QA_tmp_tl
        % \regex_replace_all:nnN
        %   { \*\* (.*?) \*\* }
        %   { \c{QAEmph} {\1} }
        %   \l_QA_tmp_tl
        % \regex_replace_all:nnN
        %   { \* (.*?) \* }
        %   { \c{emph} {\1} }
        %   \l_QA_tmp_tl
        \QA_regex_replace_case_all_skip_math:nN
          {
            { \*\*\* (.*?) \*\*\* } { \c{QAEmph} { \c{emph} { \1 } } }
            { \*\* (.*?) \*\* } { \c{QAEmph} { \1 } }
            { \* (.*?) \* } { \c{emph} { \1 } }
          } \l_QA_tmp_tl

        \regex_replace_once:nnN { ❄️ } { } \l_QA_tmp_tl

        \tl_gput_right:NV \g_QA_current_content_tl \l_QA_tmp_tl
        \tl_if_empty:NF \g_QA_current_content_tl
          {
            \tl_gput_right:Nn \g_QA_current_content_tl { \par }
          }
      }
    \__QA_put_current_content:n { #1 }
    \tl_gput_right:Nn #1 { \QAendmark }
  }

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
    \hook_gput_code:nnn { begindocument } { Q-and-A }
      {
        \setbox0=\vbox
        \bgroup
        \begin { Q-and-A }
      }
    \providecommand{\pdfpageheight}{\pageheight}
    \hook_gput_code:nnn { enddocument } { Q-and-A }
      {
        \end { Q-and-A }
        \vspace{-1mm}
        \str_case:NnT \l__QA_theme_str
          {
            { ChatGPT-dark  } {}
            { ChatGPT-light } {}
          }
          {
            \vspace{1em}
          }
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
      left=\l_QA_list_indentation_dim+1em,right=4em,
      marginparsep=.75em,
      marginparwidth=.75in,
      footnotesep=2em plus 2pt minus 2pt,
    }
    \hook_gput_code:nnn { begindocument/end } { Q-and-A }
      {
        \begin { Q-and-A }
      }
    \hook_gput_code:nnn { enddocument } { Q-and-A }
      {
        \end { Q-and-A }
      }
  }

\pagestyle { empty }

\def\textasterisk{*}
\def\textbacktick{`}
\def\textcolon{:}
\def\textequalsign{=}
\def\textleftparen{(}
\def\textrightparen{)}
\def\textsharp{\#}
\def\textvert{|}

\endinput
%%
%% End of file `Q-and-A.cls'.
