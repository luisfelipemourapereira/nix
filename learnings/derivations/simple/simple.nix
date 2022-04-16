# https://nixos.org/guides/nix-pills/working-derivation.html

# bring derivations like gcc and coreutils into scope
# inherit replaces things like 
# coreutils = coreutils
# gcc = gcc
with (import <nixpkgs> { });
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./simple_builder.sh ];
  inherit gcc coreutils;
  src = ./simple.c;
  system = builtins.currentSystem;
}
