# return nixpkgs // repository packages
let
  nixpkgs = import <nixpkgs> { };
  callPackage = import ./callPackage.nix;
  pkgs = with nixpkgs; { luaMkDerivation = import ./lua-builder.nix { }; };
in pkgs
