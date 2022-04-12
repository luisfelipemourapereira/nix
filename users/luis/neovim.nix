{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }:
{
  programs.neovim.enable = true;
  xdg.configFile.nvim = {
    source = ./pkgs/nvim;
    recursive = true;
  };
  # controlled currently by zsh configuration
  programs.neovim.viAlias = false;
  programs.neovim.vimAlias = false;
  programs.neovim.vimdiffAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;
  programs.neovim.extraPackages = [ pkgs.shfmt ];
}
