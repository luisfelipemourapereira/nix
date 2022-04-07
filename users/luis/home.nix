{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig}: {

  home.stateVersion = "21.11";

  imports = [
    ./environment.nix
    ./packages.nix
    ./starship.nix
    ./neovim.nix
    ./files.nix
    ./shell.nix
    ./alacritty.nix
  ];

  programs.home-manager.enable = true;
  home.username = "luis";

  # direnv
  programs.direnv.enable = true;

  # xsession.enable = false;
  # keyboard settings
  # home.keyboard.options = [
  #   "caps:escape"
  # ];

  # wayland.windowManager.sway = {
  #   enable = true;
  # };
}
