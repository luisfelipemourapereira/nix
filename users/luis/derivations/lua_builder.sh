#!/bin/bash
set -e
unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done
tar xvzf $src
for d in *; do
  if [ -d "$d" ]; then
    cd "$d"
    break
  fi
done
make
make install INSTALL_TOP=$out
