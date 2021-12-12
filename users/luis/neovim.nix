{ config, pkgs, nixpkgs, lib, ... }:
with programs.neovim; {
  enable = true;
  # package = pkgs.neovim-nightly;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
  withRuby = true;
  withPython3 = true;
}
