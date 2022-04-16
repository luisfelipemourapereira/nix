{ pkgs }: {
  lua = pkgs.callPackage ./derivations/lua/default.nix { };
}
