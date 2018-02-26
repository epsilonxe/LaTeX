# thaispec
Thai Language Typesetting in XeLaTeX

This package allows you to input Thai characters directly to LaTeX documents
and choose any (system wide) Thai fonts for typesetting in XeLaTeX.
It also tries to appropriately justify paragraphs with no more external tools.

## Author
Ratthaprom Promkam (ratthaprom@me.com)

## Prerequisite
Thai national fonts, i.e., SIPAFonts (See https://github.com/epsilonxe/sipafonts)

## Recommendation
Install TeX Gyre font family (Possibly included with your TeX distribution)

## Usage
If you already have TeX Gyre font family, just simply add the preamble
```
\usepackage{thaispec}
```
Otherwise
```
\usepackage[texgyrefont=false]{thaispec}
```
This package allows you to input Thai characters directly to ```.tex``` file,
and choose any Thai fonts to be used in the document.
In order to choose the font, please make sure that the font is system wide, then use
```
\usepackage[thaifont = <SYSTEM THAI FONT NAME>]{thaispec}
```
Moreover, the package give you options to choose any system wide fonts for
`mainfont`, `sansfont` and  `monofont` too

For additional usage or more options, see the documentation.

## Credits
This package is motivated by a set of LaTex commands for typesetting Thai documents
provided by Dittaya Wanvarie from Chulalongkorn University.
(See http://pioneer.netserv.chula.ac.th/~wdittaya/)

## License
Copyright 2018 Ratthaprom Promkam

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license of (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.
