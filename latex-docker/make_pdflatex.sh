#!/bin/sh
TexCmd="pdflatex $1 && pdflatex $1"
BashCmd="/bin/bash -c \"${TexCmd}\""
echo ${BashCmd}

exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data blang/latex "$BashCmd"
