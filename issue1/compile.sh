#!/bin/bash

for X in "jhps-issue1-ClassifyingTemporalCharacteristicsofJobIOUsingMachineLearningTechniques" ; do
  git clone git@github.com:VI4IO/$X.git
  pushd $X
  latexmk -pdf main.tex
  popd
done

latexmk -pdf main.tex

mv main.pdf JHPS-issue1-compendium.pdf
