#!/bin/bash

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
