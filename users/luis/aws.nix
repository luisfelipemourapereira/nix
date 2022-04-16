{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }:
{
  xdg.configFile.aws = {
    source = ./pkgs/aws;
    recursive = true;
  };
}
