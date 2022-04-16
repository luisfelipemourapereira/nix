# a derivation takes in a pkgs namespace with
# pkgs.derivation access tree.
pkgs: attrs:
with pkgs;
let defaultAttrs = {
  builder = "${bash}/bin/bash"
    args = [ ./builder.sh ];
  baseInputs = [ gnutar gzip gnumake gcc buildutils-unwrapped coreutils gawk gnused gnugrep ];
  buildInputs = [ ];
  system = builtins.currentSystem;
};
in
# // lets you do overrides baseConfiguration // overrideConfiguration
derivation (defaultAttrs // attrs)
