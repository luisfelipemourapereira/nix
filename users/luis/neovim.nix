{ config, pkgs, nixpkgs, lib, ... }:
with programs.neovim; {
  # with programs.neovim;
  # {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
  withRuby = true;
  withPython3 = true;
  enable = true;
  # }
  # # uncomment to target nightly build
  # # programs.neovim.package = pkgs.neovim-nightly;
  # programs.neovim.viAlias = true;
  # programs.neovim.vimAlias = true;
  # programs.neovim.vimdiffAlias = true;
  # programs.neovim.withNodeJs = true;
  # programs.neovim.withRuby = true;
  # programs.neovim.withPython3 = true;
}
