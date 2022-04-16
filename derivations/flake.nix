###############################################################################
# multiple system identities here
#
# .#rio = laptop
###############################################################################

{
  description = "local packages";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, utils, ... }: {
    packages.x86_64-linux.lua = import ./awsconfig/default.nix { };
    # let
    #   pkgsFor = system: import nixpkgs {
    #     inherit system;
    #   };
    # in
    # {
    #   overlay = final: prev: {
    #     lua = prev.callPackage ./awsconfig { };
    #   };
    # } // utils.lib.eachDefaultSystem (system:
    #   let pkgs = pkgsFor system;
    #   in
    #   {
    #     packages.system.lua = pkgs.lua;
    #   }
    # );
  };
}
