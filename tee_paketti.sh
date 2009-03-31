#!/bin/sh
R --vanilla < Ani_funktiot.R
cp DESCRIPTION Animal/
mkdir Animal/inst
mkdir Animal/inst/doc
cp CITATION Animal/inst
rm Animal/Read-and-delete-me
rm Animal/man/*
cp man/* Animal/man
cp vignette/Animal.Rnw vignette/calf1.bh1 Animal/inst/doc
R CMD build Animal
R CMD INSTALL Animal_1.02.tar.gz 
R CMD check Animal_1.02.tar.gz
R CMD Rd2dvi --pdf Animal
cp -r Animal pkg
