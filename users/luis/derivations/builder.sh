#!/bin/bash
set -e
unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done
# tar -xf $src
# cp -r $src $out

# for d in *; do
#   if [ -d "$d" ]; then
#     cd "$d"
#     break
#   fi
# done
# ls $src > $out
# ./configure --prefix=$out
# cd $src
# pwd > $out
# whoami > $out
chown -R $(whoami) $src
cp -r $src/* .
make CMAKE_INSTALL_PREFIX=$out
make install
