#!/bin/bash

cd /Isolette/Code/

rm -rf /Isolette/Code/@PATH_DOXYGEN_TEST_OUTPUT@/
rm -rf /Isolette/Code/@PATH_DOXYGEN_SYSTEM_OUTPUT@/

doxygen Doxyfile_test_2
doxygen Doxyfile_system_2

echo "Eseguo la compilazione doxygen"

echo "Eseguo Compinazione Test"

cd /Isolette/Code/@PATH_DOXYGEN_TEST_OUTPUT@/latex
make
echo "Eseguita la compilzione Test"

echo "Eseguo Compinazioe System"
cd /Isolette/Code/@PATH_DOXYGEN_SYSTEM_OUTPUT@/latex
make
echo "Eseguita la compilzione System"