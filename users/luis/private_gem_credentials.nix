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
  home.file.".gem" = {
    source = ./pkgs/gem;
    recursive = true;
  };
}
