#!/bin/bash

###################################################################
# OCaml QA scripts
# Author: Pierre-Malo Deniélou
# License: GPLv2
###################################################################
# This script will try to link all installed OCaml modules together
###################################################################

PACKAGES=`ocamlfind list | cut -d '(' -f 1 | sed 's/^/-package /'| sed 's/-package camlp4.fulllib//'  | xargs echo`


THREAD=-thread

    ocamlfind ocamlc -o test $THREAD $PACKAGES -linkpkg -g test.ml
    if [ "$?" = "2" ]
    then 
        echo "[FAIL] All Bytecode"
     else 
        echo "[ OK ] $p Bytecode"
    fi
    ocamlfind ocamlopt -o test $THREAD $PACKAGES -linkpkg -g test.ml
    if [ "$?" = "2" ]
    then 
        echo "[FAIL] All Native"
     else 
        echo "[ OK ] $p Native"
    fi
