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
        with xorg;
        with pkgs.rubyPackages_3_1;
        with pkgs.nodePackages_latest;
        [
          vscode-css-languageserver-bin
          sumneko-lua-language-server
          terraform-ls
          tflint
          arduino-language-server
          terraform-docs
          terraform-landscape
          terraform-compliance
          grex
          exa
          sops
          skim
          stig
          zlib
          pnpm
          gdb
          age
          lua
          bat
          php
          feh
          fd
          sd
          youtube-dl
          transmission
          tree-sitter
          pkgs.poetry
          solargraph
          hyperfine
          bandwhich
          prettier
          rnix-lsp
          tealdeer
          himalaya
          json2hcl
          node2nix
          luarocks
          cpulimit
          nushell
          ansible
          openssl
          gradle
          xrandr
          httpie
          zoxide
          nodejs
          asmfmt
          trunk
          whois
          shfmt
          delta
          xclip
          rbenv
          procs
          tokei
        ]
        ++ import ./kubernetes pkgs
        ++ import ./rustlang pkgs
        ++ import ./python pkgs
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
