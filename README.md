<!-- Copyright (C) 2023 by Jinwen XU -->

# `Q-and-A` — Typesetting Q\&A-style conversation made easier

## Introduction

`Q-and-A` is a LaTeX document class for you to typeset Q&A-style conversation. It turns simple pure text Q&A dialog into carefully designed document.

Notably, it features two themes, `ChatGPT-light` and `ChatGPT-dark`, enabling you to format your Q&A dialog in a way that closely resembles the interface of ChatGPT.

## Installation and preparation

### How to install this package

If you are using TeX Live 2024 or newer, or the most recent version of MikTeX, then this package should already be included, and you don't need to do anything.

Otherwise, you need to check for package update to see if you can receive it. In case not, you can always go to [the CTAN page](https://ctan.org/pkg/Q-and-A) to download the `.zip` file with all related files included.

## Usage

Please refer to [the documentation](https://github.com/Jinwen-XU/Q-and-A/blob/main/doc/Q-and-A-doc.pdf) for detailed usage.

> You may get started by exploring [the demo documents](https://github.com/Jinwen-XU/Q-and-A/tree/main/demo).

> If you don't find what you were expecting, or if you would like some elements to be changed or improved, feel free to post a feature request via [the GitHub issue](https://github.com/Jinwen-XU/Q-and-A/issues).


## TeXnical details

### Engines and base classes
- With pdfLaTeX, the base class is `minimart`.
- With XeLaTeX or LuaLaTeX, the base class is `einfart`.

### Regarding the fonts

If you are using XeLaTeX or LuaLaTeX to compile your document, then the current document class requires the following open-source fonts that are not included in the standard TeX collection:

- The Source Han font series at [Adobe Fonts](https://github.com/adobe-fonts). More specifically:
  - Source Han Serif, [go to its Release page](https://github.com/adobe-fonts/source-han-serif/releases).
  - Source Han Sans, [go to its Release page](https://github.com/adobe-fonts/source-han-sans/releases).
  - Source Han Mono, [go to its Release page](https://github.com/adobe-fonts/source-han-mono/releases).
  > It is recommended to download the Super-OTC version, so that the total download size would be smaller, and the installation would be easier.

These are necessary if you wish to write your document in Chinese (either simplified or traditional) or Japanese. Also, without these fonts installed, the compilation speed might be much slower — the compilation would still pass, but the system shall spend (quite) some time verifying that the fonts are indeed missing before switching to the fallback fonts.

### Functionality
The main features are achieved with the power of LaTeX3's regex functionality. It scans the content paragraph by paragraph and converts recognized patterns into corresponding TeX commands.
However, this comes with a price: in order to scan the content, it is firstly stored in a macro, and that means that you cannot use commands like `\verb` in your main text.
Also, synctex won't work properly.

### Language and date format
Language and date format can both be set in two ways: as class option or with corresponding commands.
- The user-level command for setting language is `\UseLanguage`, provided by `projlib-language`; the one for setting date format is `\SetDatetimeInputFormat`, provided by `projlib-date`.
- When you set the language, it is not exactly the same using class option or using command: when you select a language via class option, only the setting for this language would be loaded; however, with `\UseLanguage`, it would load *all* the language settings and then switch to your selected one. Sometimes the page breaking behavior differs slightly. Personally I prefer the `\UseLanguage` approach, for this would allow you to switch language in the middle of your document.

### Scroll mode
The scroll mode is achieved by directly accessing `\pdfpageheight` (pdfTeX and XeTeX) or `\pageheight` (LuaTeX). <!-- The minimal page height is set to be `10in`. --> It is worth noting that in order to calculate the height needed, the entire content are put into a single box, which puts a limitation on the length of your document (but this usually wouldn't be a problem).

# License

This work is released under the LaTeX Project Public License, v1.3c or later.

The ChatGPT logo image used in the demo document is *not* an official version. It has been created by the author by overlaying the OpenAI logo onto a colored background, with the background color being extracted directly from the ChatGPT interface using a color picker tool. This was done solely for the purpose of replicating the layout of the actual ChatGPT interface.
The author does not assert any copyright claims or ownership over the design of this logo. Users are kindly advised to replace this logo image in their respective documents with their own authorized version.
