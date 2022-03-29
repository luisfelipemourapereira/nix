# ##############################################################################
# change build toolchain by passing a different builder (mkDerivation func)
# this parameterized expression returns a derivation primitive.
# it defines build dependencies of this software but not the general
# builder for software like it.  That is encapsulated in fetchurl.
###############################################################################

{ mkDerivation, fetchurl }:
mkDerivation {
  name = "lua";
  src = fetchurl {
    url = "https://www.lua.org/ftp/lua-5.4.3.tar.gz";
    sha256 = "+GEidhaeO/y8+48iYZW/xuRm/hMELxB2y96St+yWu/s=";
  };
}

###############################################################################
# non-inputs style
###############################################################################

# let
# pkgs = import <nixpkgs> { };
# mkDerivation = import ./lua-builder.nix pkgs;
# in mkDerivation {
# name = "lua";
# src = pkgs.fetchurl {
# url = "https://www.lua.org/ftp/lua-5.4.3.tar.gz";
# sha256 = "+GEidhaeO/y8+48iYZW/xuRm/hMELxB2y96St+yWu/s=";
# };
# }
