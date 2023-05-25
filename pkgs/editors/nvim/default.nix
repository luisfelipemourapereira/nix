# WIP: this is not working yet
args:

let
  # imports
  pkgs = args.pkgs;
  stdenv = args.stdenv;

  # values
  name = "neovim";
  owner = "neovim";
  repo = "neovim";
  rev = "master";
  sha256 = "1pzlrwz9c3hf79hhzfhmz5wh2kbypb4dxn4ajg6pi9n3yq0vh6iz";

  # grab the source
  src = pkgs.fetchFromGitHub { inherit owner repo rev sha256; };

in

stdenv.mkDerivation {
  inherit name src;
  buildInputs = with pkgs;[
    pkgconfig
    xorg.libX11
    xorg.libXt
    xorg.libSM
    xorg.libICE
    lua
    luajit
    msgpack
    pkg-config
    unibilium
    xorg.libXtst
  ];
  nativeBuildInputs = with pkgs;[
    pkgconfig
  ];
  buildPhase = ''
    make CMAKE_BUILD_TYPE=RelWithDebInfo
  '';
  installPhase = ''
    make install DESTDIR=$out
  '';
}

