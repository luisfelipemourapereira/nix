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
          pkgs.redis
          pkgs.redis-dump
          pkgs.redli
          python39Packages.pipenv-poetry-migrate
          python39Packages.poetry-core
          vscode-css-languageserver-bin
          sumneko-lua-language-server
          awscli2
          terraform-ls
          tflint
          arduino-language-server
          terraform-docs
          terraform-landscape
          terraform-compliance
          rust-code-analysis
          go-task
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
          go
          fd
          sd
          youtube-dl
          rust-analyzer
          transmission
          tree-sitter
          rust-script
          pkgs.poetry
          cloud-nuke
          solargraph
          rustic-rs
          rust-motd
          rusty-man
          hyperfine
          bandwhich
          cdktf-cli
          prettier
          rnix-lsp
          tealdeer
          himalaya
          json2hcl
          node2nix
          luarocks
          rustscan
          cpulimit
          nushell
          ansible
          openssl
          rustfmt
          rustcat
          gofumpt
          gradle
          xrandr
          pipenv
          httpie
          zoxide
          nodejs
          gobang
          asmfmt
          trunk
          rustc
          whois
          shfmt
          black
          delta
          xclip
          rbenv
          procs
          tokei
        ]
        ++ lib.optionals isDarwin [
          (zulu.overrideAttrs (_:
            {
              # hack the jdk package because of a dumb bug
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
          traceroute
          iproute2
          sheldon
          fcitx5
          julia
          docker
        ];
    })
  ];
}
