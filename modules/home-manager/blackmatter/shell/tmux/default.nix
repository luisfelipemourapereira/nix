{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.blackmatter;
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;
in
{
  options = {
    blackmatter = {
      shell.tmux.enable = mkEnableOption "shell.tmux";
    };
  };

  config = mkMerge [
    (mkIf cfg.shell.tmux.enable {
      programs = {
        tmux = {
          enable = true;
          terminal = "alacritty";
          aggressiveResize = false;
          baseIndex = 1;
          clock24 = false;
          customPaneNavigationAndResize = false;
          disableConfirmationPrompt = false;
          escapeTime = 1;
          historyLimit = 1000000;
          keyMode = "vi";
          newSession = false;
          # plugins = with pkgs.tmuxPlugins; [ better-mouse-mode ];
          shortcut = "f";
          reverseSplit = false;
          resizeAmount = 1;
          secureSocket = false;
          sensibleOnTop = false;


          tmuxinator = {
            enable = false;
          };
          tmuxp = { enable = false; };
        } // lib.optionalAttrs isLinux {
          extraConfig = builtins.readFile ./tmux-linux.conf;
          shell = "${pkgs.zsh}/bin/zsh";
        } // lib.optionalAttrs isDarwin {
          extraConfig = builtins.readFile ./tmux-darwin.conf;
          shell = "/bin/zsh";
        };
      };
    })
  ];
}
