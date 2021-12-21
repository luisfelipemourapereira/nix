{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  programs.home-manager.enable = true;
  imports = [
    ./packages.nix
    ./environment.nix
    ./starship.nix
    ./shell.nix
    ./neovim.nix
    ./files.nix
  ];
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "21.11";
}
