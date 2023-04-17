{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.blackmatter;
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
          newSession = true;
          plugins = with pkgs.tmuxPlugins; [ better-mouse-mode ];
          shortcut = "f";
          reverseSplit = false;
          resizeAmount = "1";
          secureSocket = true;
          sensibleOnTop = true;
          shell = "zsh";
          tmuxinator = { enable = true; };
          tmuxp = { enable = true; };
          extraConfig = builtins.readFile ./tmux.conf;
        };
      };
    })
  ];
}
