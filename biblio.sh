#!/usr/local/bin/bash

pandoc \
    -M author="Thomas Barba" \
    -M date="$DATE" \
    -f latex+raw_tex -N -R \
    --smart \
    --bibliography=/Users/tom/Documents/LaTeX/library.bib \
    --csl=/Users/tom/Desktop/nature.csl \
    -o MyPaper.pdf MyPaper.tex
