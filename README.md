# LaTeX
LaTeX resource

## Usage
At your project folder, clone this repository with its submodules
```sh
$ git clone --recursive https://github.com/epsilonxe/latex .
```
## Docker
To typeset ```your-tex-file.tex``` via a docker containter, use the command
```sh
$ docker-compose run latex ./typeset.sh pdflatex your-tex-file
```
The argument ```pdflatex``` can be replaced by ```xelatex``` if needed.
Your ouput ```your-tex-file.pdf``` will be put in ```OutputDir`` by default.
