# thaispec
Thai Language Typesetting in XeLaTeX

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
```mainfont```,```sansfont```, ```monofont``` too

## Credit
This package is motivated by a set of LaTex commands for typesetting Thai documents
provided by Dittaya Wanvarie from Chulalongkorn University.
(See http://pioneer.netserv.chula.ac.th/~wdittaya/)
