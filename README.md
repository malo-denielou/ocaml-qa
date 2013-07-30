ocaml-qa
========

Scripts to test the quality of an OCaml installation.

Current scripts can test:
- if META files have correct requires
- if C-libraries are installed correctly
- if all installed libraries are compiled consistently

Requirements
------------

* A Linux system with bash (it has not been tested elsewhere)
* ocaml and ocamlfind must be installed
* test.ml must be in the current directory

Usage
-----

* run eachtest.sh to compile test.ml with each of the OCaml libraries that
  ocamlfind can find on the current system. This allows to detect META files
  errors and packaging errors in your Linux distribution.

* run alltest.sh to compile test.ml with all the OCaml libraries available on
  your system. This allows to detect if some of your libraries where compiled in
  the wrong order (mismatching module hashes).

