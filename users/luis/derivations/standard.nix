# example of standard derivation
# below derivation is minimal required parameters
#stdenv.mkDerivation rec {
#  # pname and version over name as a standard
#  # will produce a name like "#{pname}-#{version}"
# with (import <nixpkgs> { });
# derivation {
# builder = "${bash}/bin/bash";
# # system = "x86_64-linux";
# system = builtins.currentSystem;
# name = "neovim";
# args = [ ./builder.sh ];
# src = fetchFromGitHub {
# owner = "neovim";
# repo = "neovim";
# rev = "v0.6.0";
# sha256 = "sha256-mVVZiDjAsAs4PgC8lHf0Ro1uKJ4OKonoPtF59eUd888=";
# };
# }
let
  pkgs = import <nixpkgs> { };
  mkDerivation = import ./autotools.nix pkgs;
in mkDerivation {
  name = "neovim";
  src = pkgs.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "v0.6.0";
    sha256 = "sha256-mVVZiDjAsAs4PgC8lHf0Ro1uKJ4OKonoPtF59eUd888=";
  };
}
#  pname = "libfoo";
#  version = "1.2.3";
#  src = fetchurl {
#    url = "http://example.org/libfoo-source-${version}.tar.bz2";
#    sha256 = "0x2g1jqygyr5wiwg4ma1nd7w4ydpy82z9gkcv8vh2v8dn3y58v5m";
#  };
#}
