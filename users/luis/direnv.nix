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
  # direnv
  programs.direnv.enable = true;
}
