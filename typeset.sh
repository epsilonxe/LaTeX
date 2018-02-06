#!/bin/bash
texengin=$1
name=$2
$texengin -interaction=nonstopmode $name
rm ./*.aux ./*.log math/*.aux thai/*.aux
rm ./*.auxlock ./*.nav ./*.out ./*.snm ./*.toc ./*.vrb
