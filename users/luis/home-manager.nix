{ config
, pkgs
, nixpkgs
, lib
, specialArgs
, options
, modulesPath
, nixosConfig
, osConfig
}: {
  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
  home.username = "luis";
}
