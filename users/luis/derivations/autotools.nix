pkgs: attrs:
with pkgs;
let
  defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    baseInputs = [
      binutils-unwrapped
      coreutils
      gnumake
      gnugrep
      gnutar
      gnused
      gzip
      gcc
      gawk
    ];
    system = builtins.currentSystem;
  };
in derivation (defaultAttrs // attrs)
