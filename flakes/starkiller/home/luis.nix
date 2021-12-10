{ config, pkgs, nixpkgs, ... }: { 
  # home-manager manage itself
  programs.home-manager.enable = true;

  # home configuration
  home.username = "luis"; 
  home.homeDirectory = "/home/luis"; 
  
  # session variables
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # user packages
  home.packages = with pkgs; [
    ripgrep
  ];
  
  # jq
  programs.jq.enable = true;

  # neovim configuration
  programs.neovim.enable = true;
  # programs.neovim.package = pkgs.neovim-nightly;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withRuby = true;
  programs.neovim.withPython3 = true;

  # starship command prompt
  programs.starship.enable = true;

  # alacritty terminal
  programs.alacritty.enable = true;

  # zsh shell
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.prezto.enable = true;

  home.stateVersion = "21.11";
}
