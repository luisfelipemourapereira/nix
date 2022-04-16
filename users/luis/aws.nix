{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }:
{
  home.file.aws = {
    source = ./pkgs/aws;
    recursive = true;
  };
}
