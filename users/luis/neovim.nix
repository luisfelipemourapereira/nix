{ config, pkgs, nixpkgs, lib, ... }:
with programs; {
  neovim.enable = true;
  neovim.viAlias = true;
  neovim.vimAlias = true;
  neovim.vimdiffAlias = true;
  neovim.withNodeJs = true;
  neovim.withRuby = true;
  neovim.withPython3 = true;
}
