with (import <nixpkgs> { });
derivation {
  builder = "${bash}/bin/bash";
  system = "x86_64-linux";
  name = "neovim";
  args = [ ./builder.sh ];
  src = fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "v0.6.0";
    sha256 = "sha256-mVVZiDjAsAs4PgC8lHf0Ro1uKJ4OKonoPtF59eUd888=";
  };
}
