let
  nixos-lib = import "$(<nixpkgs>)/nixos/lib" { };
  mkTest = import ../../functions/testing/mkTest.nix;
  tests = {
    blackmatter = mkTest ./modules/edge/blackmatter.nix;
  };
in
{ }

# nixos-lib.runTest {
#   imports = [ ./testing/provision.nix ];
#   hostPkgs = { };
# }
