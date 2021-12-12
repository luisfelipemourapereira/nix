{ config, pkgs, nixpkgs, lib, programs, ... }:
with programs; {
  neovim.enable = true;
  # package = pkgs.neovim-nightly;
  neovim.viAlias = true;
  neovim.vimAlias = true;
  neovim.vimdiffAlias = true;
  neovim.withNodeJs = true;
  neovim.withRuby = true;
  neovim.withPython3 = true;
}
