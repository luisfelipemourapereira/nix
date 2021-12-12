{ config, pkgs, nixpkgs, lib, ... }: {
  programs.neovim.enable = true;
  # uncomment to target nightly build
  # programs.neovim.package = pkgs.neovim-nightly;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;
}
