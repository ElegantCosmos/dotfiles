#!/usr/bin/env bash

### Create stand-alone tikzpicture LaTeX file.
filepath=$1
filepath_new=${filepath%.*}-tmp.tex
echo "\documentclass[crop,tikz]{standalone}%" > $filepath_new
echo "\begin{document}" >> $filepath_new
cat ${filepath} >> $filepath_new
echo "\end{document}" >> $filepath_new

### Compile to PDF.
pdflatex $filepath_new
#mv ${filepath_new%.*}.pdf ${filepath%.*}.pdf
