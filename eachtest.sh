#!/bin/bash

###################################################################
# OCaml QA scripts
# Author: Pierre-Malo Deniélou
# License: GPLv2
###################################################################
# This script will try to separately link each OCaml module.
###################################################################

PACKAGES=`ocamlfind list | cut -d '(' -f 1 | xargs echo`
MSG="=> All good "

THREAD=-thread

echo "= Testing individual Ocaml packages ="
echo "$PACKAGES"
for p in $PACKAGES
do
    ocamlfind ocamlc -o test $THREAD -package $p -linkpkg -g test.ml
    if [ "$?" = "2" ]
    then 
        echo "[FAIL] $p Bytecode"
     else 
        echo "[ OK ] $p Bytecode"
    fi
    ocamlfind ocamlopt -o test $THREAD -package $p -linkpkg -g test.ml
    if [ "$?" = "2" ]
    then 
        echo "[FAIL] $p Native"
     else 
        echo "[ OK ] $p Native"
    fi
done

# echo $MSG




# for p in $PACKAGES
# do
#     if ocamlfind ocamlc -o test -thread -package $p -linkpkg -g test.ml
#     then 
#         echo "[OK] $p Bytecode"
#     else 
#         MSG=`echo $MSG "except $p "`
#         echo "[Fail] $p Bytecode"
#     fi
#     if ocamlfind ocamlopt -o test -thread -package $p -linkpkg -g test.ml
#     then 
#         echo "[OK] $p Native"
#     else 
#         echo "[Fail] $p Native"
#     fi
# done









# echo "= Testing all Ocaml packages ="
# if ocamlfind ocamlc -o test $(MLOPT) -linkpkg -g test.ml
# then echo "[OK] Bytecode link"
# else echo "[Fail] Bytecode link"
# fi
# if ocamlfind ocamlopt -o test $(MLOPT) -linkpkg -g test.ml
# then echo "[OK] Native link"
# else echo "[Fail] Native link"
# fi

#ocamlfind list | cut -d '(' -f 1 | xargs echo
