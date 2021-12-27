pkgs: attrs:
with pkgs;
let
  defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./lua_builder.sh ];
    baseInputs = [ gnutar gzip coreutils gnumake bash gcc bintools.bintools ];
    system = builtins.currentSystem;
  };
in derivation (defaultAttrs // attrs)
