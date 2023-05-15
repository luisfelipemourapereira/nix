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

      home.packages =
        with pkgs;
        # with xorg;
        [
          nodePackages_latest.vscode-css-languageserver-bin
          nodePackages_latest.prettier
          sumneko-lua-language-server
          nodePackages_latest.pnpm
          arduino-language-server
          zlib
          lua
          php
          youtube-dl
          transmission
          tree-sitter
          pkgs.poetry
          solargraph
          rnix-lsp
          tealdeer
          himalaya
          luarocks
          nodejs
          asmfmt
          shfmt
          rbenv
        ]
        ++ import ./kubernetes pkgs
        ++ import ./hashicorp pkgs
        ++ import ./utilities pkgs
        ++ import ./rustlang pkgs
        ++ import ./secrets pkgs
        ++ import ./python pkgs
        ++ import ./golang pkgs
        ++ import ./redis pkgs
        ++ import ./aws pkgs
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
          traceroute
          iproute2
          sheldon
          fcitx5
          docker
          julia
          tig
        ];
    })
  ];
}
