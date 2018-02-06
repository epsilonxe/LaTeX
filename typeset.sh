#!/bin/bash
texengin=$1
name=$2
$texengin -interaction=nonstopmode $name
rm ./*.aux ./*.log ./*.auxlock ./*.nav ./*.out ./*.snm ./*.toc ./*.vrb
