{ config, pkgs, ... }: { 
  programs.home-manager.enable = true;
  
  # starship command prompt
  programs.starship.enable = true;

  # alacritty terminal
  programs.alacritty.enable = true;

  # zsh shell
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.prezto.enable = true;

  # home configuration
  home.username = "luis"; 
  home.homeDirectory = "/home/luis"; 

  # user packages
  home.packages = with pkgs; [
    jq
    neovim
    ripgrep
  ];
  
  # session variables
  home.sessionVariables = {
    EDITOR = "neovim";
  };
  home.stateVersion = "21.11";
}
