###############################################################################
# expose your local packages via a flake
###############################################################################

{
  description = "local packages";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, utils, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.x86_64-linux.autorandr-rs = pkgs.callPackage ./pkgs/autorandr-rs/default.nix { };
    };
}
