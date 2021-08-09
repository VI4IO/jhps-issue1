#!/bin/bash

for X in "jhps-issue2-tsujita" jhps-issue2-kunkel; do
  git clone git@github.com:VI4IO/$X.git
  pushd $X
  latexmk -pdf main.tex
  popd
done

latexmk -pdf main.tex

mv main.pdf JHPS-issue2-compendium.pdf
