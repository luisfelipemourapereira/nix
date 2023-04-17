{ lib, config, ... }:
with lib;
let
  cfg = config.blackmatter;
in
{
  imports = [
    ./background
    ./starship
    ./packages
    ./sheldon
    ./tools
    ./zsh
    ./fzf
    ./tmux
  ];

  options = {
    blackmatter = {
      shell.enable = mkEnableOption "shell";
    };
  };

  config = mkMerge [
    (mkIf config.blackmatter.shell.enable {
      blackmatter.shell.background.enable = true;
      blackmatter.shell.packages.enable = true;
      blackmatter.shell.starship.enable = true;
      blackmatter.shell.tools.enable = true;
      blackmatter.shell.zsh.enable = true;
      blackmatter.shell.fzf.enable = true;
      blackmatter.shell.tmux.enable = true;
      xdg.configFile."rubocop/config.yml".source = ./rubocop/config.yml;
      home.file.".solargraph.yml".source = ./solargraph/config.yml;
      programs.zellij.enable = false;
      programs.zellij.settings = {
        disable_default_layout_keybindings = true;
        disable_default_mode_keybindings = true;
        disable_default_status = true;
        default_mode = "normal";
        hide_border = true;
        hide_tab_bar = true;
        hide_tab_indices = true;
        hide_up_down_panes = true;
        windows_can_close = true;
      };
    })
  ];
}
