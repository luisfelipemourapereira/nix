let
  pkgs = import <nixpkgs> { };
  mkDerivation = import ./lua-builder.nix pkgs;
in mkDerivation {
  name = "lua";
  src = pkgs.fetchurl {
    url = "https://www.lua.org/ftp/lua-5.4.3.tar.gz";
    sha256 = "+GEidhaeO/y8+48iYZW/xuRm/hMELxB2y96St+yWu/s=";
  };
}
