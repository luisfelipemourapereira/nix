# https://lethalman.blogspot.com/2016/04/cheap-docker-images-with-nix_15.html
# https://nixos.org/guides/building-and-running-docker-images.html
###############################################################################
# TODO: not in use
###############################################################################
{ pkgs ? import <nixpkgs> { } }:
pkgs.dockerTools.buildImage {
  name = "redis";
  tag = "latest";

  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = [ pkgs.redis ];
    pathsToLink = [ "/bin" ];
  };

  runAsRoot = ''
    #!${pkgs.runtimeShell}
    mkdir -p /data
  '';

  config = {
    Cmd = [ "/bin/redis-server" ];
    WorkingDir = "/data";
    Volumes = { "/data" = { }; };
  };

  diskSize = 1024;
  buildVMMemorySize = 512;
}
# TODO: not in use
