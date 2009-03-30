#!/bin/sh
R --vanilla < Ani_funktiot.R
cp DESCRIPTION Animal/
mkdir Animal/inst
cp CITATION Animal/inst
rm Animal/Read-and-delete-me
rm Animal/man/*
cp man/* Animal/man
R CMD build Animal
R CMD INSTALL Animal_1.01.tar.gz 
R CMD check Animal_1.01.tar.gz
R CMD Rd2dvi --pdf Animal
cp -r Animal pkg
