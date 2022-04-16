{ stdenv, pkgs }:
stdenv.mkDerivation {
  pname = "lua";
  src = pkgs.fetchFromGitHub {
    owner = "lua";
    repo = "lua";
    rev = "5d708c3f9cae12820e415d4f89c9eacbe2ab964b";
    sha256 = "wut";
  };
}
