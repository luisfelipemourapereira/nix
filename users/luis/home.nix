{ config, pkgs, nixpkgs, lib, specialArgs, options, modulesPath, nixosConfig
, osConfig }: {
  imports = [
    ./environment.nix
    ./packages.nix
    ./starship.nix
    ./neovim.nix
    ./files.nix
    ./shell.nix
  ];
  programs.home-manager.enable = true;
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  home.stateVersion = "21.11";
}
