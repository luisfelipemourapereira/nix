pkgs: attrs:
with pkgs;
let
  defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    baseInputs = [
      binutils-unwrapped
      coreutils
      pkg-config
      gnumake
      gnugrep
      gnutar
      gnused
      cmake
      bash
      gzip
      gawk
      gcc
      lua
    ];
    system = builtins.currentSystem;
  };
in derivation (defaultAttrs // attrs)
