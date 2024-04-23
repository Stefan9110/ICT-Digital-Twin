#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

if [ -z $2 ]; then
  BUILD_DIR="build"
else
  BUILD_DIR=$2
fi

if [ ! -d "$BUILD_DIR" ]; then
  mkdir "$BUILD_DIR"
fi

if [ -f "main.bib" ]; then
  cp main.bib "$BUILD_DIR"
fi

pdflatex -output-directory="$BUILD_DIR" -jobname=$1 -interaction=nonstopmode main.tex >/dev/null
if [ $? -ne 0 ]; then
  echo "Error: pdflatex failed."
  echo "=========================== ERROR LOG ==========================="
  grep -A 5 -B 1 "!" "$BUILD_DIR/$1.log"
  echo "================================================================"
  exit 1
fi

(cd "$BUILD_DIR"  && bibtex $1) >/dev/null
pdflatex -output-directory="$BUILD_DIR"  -jobname=$1 -interaction=nonstopmode main.tex >/dev/null
pdflatex -output-directory="$BUILD_DIR"  -jobname=$1 -interaction=nonstopmode main.tex >/dev/null
