{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.blackmatter;
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;
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
          nixopsUnstable
          lazydocker
          lazygit
          traceroute
          iproute2
          sheldon
          fcitx5
          julia
        ];
    })
  ];
}
