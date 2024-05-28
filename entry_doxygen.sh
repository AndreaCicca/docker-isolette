#!/bin/bash

cd /Isolette/Code/

echo "Eseguo la compilazione doxygen"

# Prepare.
./prepare.sh

# Build.
./build.sh

#Compile doxygen
./compile_doxygen.sh