with (import <nixpkgs> { });
derivation {
  builder = "${bash}/bin/bash";
  system = "x86_64-linux";
  name = "neovim";
  args = [ ./builder.sh ];
}
