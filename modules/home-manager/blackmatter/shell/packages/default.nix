{ lib, pkgs, config, stdenv, ... }:
with lib;
let
  cfg = config.blackmatter;
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;

  # linux only
  docker-compose-alternative = stdenv.mkDerivation rec {
    name = "docker-compose";
    version = "2.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/docker/compose/releases/download/v${version}/docker-compose-Linux-x86_64";
      sha256 = "sha256-tOav8Uww+CzibpTTdoa1WYs/hwzh4FOSfIU7T0sShXU=";
    };

    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/docker-compose
      chmod +x $out/bin/docker-compose
    '';
  };
in
{
  options = {
    blackmatter = {
      shell.packages.enable =
        mkEnableOption "shell.packages";
    };
  };

  config = mkMerge [
    (mkIf cfg.shell.packages.enable {

      home.packages = with pkgs;
        [
          docker
          delve
          tree
          lazydocker
          nixopsUnstable
          lazygit
          twitch-tui
          wiki-tui
          tuir
          spotify-tui
          saml2aws
          tuifeed
          kompose
          podman-compose
          # TODO: install later when macos build issue is over
          # tree
        ]
        ++ import ./kubernetes pkgs
        ++ import ./javascript pkgs
        ++ import ./hashicorp pkgs
        ++ import ./utilities pkgs
        ++ import ./rustlang pkgs
        ++ import ./secrets pkgs
        ++ import ./arduino pkgs
        ++ import ./python pkgs
        ++ import ./golang pkgs
        ++ import ./redis pkgs
        ++ import ./ruby pkgs
        ++ import ./shell pkgs
        ++ import ./aws pkgs
        ++ import ./nix pkgs
        ++ import ./asm pkgs
        ++ import ./lua pkgs
        ++ import ./php pkgs
        ++ lib.optionals isDarwin [
          (zulu.overrideAttrs (_:
            {
              # hack the jdk package because of a dumb bug on macos
              # https://github.com/LnL7/nix-darwin/issues/320
              postPatch = ''
                rm -rf share/man
                rm -rf man
                mkdir -p share
                ln -s ../zulu-11.jdk/Contents/Home/man/ share

              '';
            }
          ))
        ]
        ++ lib.optionals isLinux [
          docker-compose-alternative
          traceroute
          iproute2
          s-tui
          sheldon
          julia
        ];
    })
  ];
}
