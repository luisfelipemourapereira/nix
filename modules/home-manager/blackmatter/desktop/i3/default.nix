{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.blackmatter;
  monitors = cfg.desktop.monitors;
  # monitors.main = { name = "DisplayPort-0"; };
  # refactor this is for plo
  # monitors.main = { name = "DP-2"; };
  nord.graphics.indicator = ">";
  nord.graphics.border.child = "1";
  nord.colors = rec {
    i3lock.background.blue = "#2E3440";
    primary = "#5E81AC";
    secondary = "#D8DEE9";
    tertiary = "#88C0D0";
    highlight = "#BF616A";
    foreground = "#ECEFF4";
    background.blue = "#2E3440";
    background.teal = "#8fbcbb";
    text.white = "#d8dee9";
    error.red = highlight;
    error.background.grey = "#4c566a";
  };

  themes.nord = rec {

    rofi = "Arc-Dark";
    globals = {
      colors.focused = {
        border = nord.colors.background.blue;
        background = nord.colors.background.blue;
        text = nord.colors.text.white;
        indicator = nord.graphics.indicator;
        childBorder = nord.graphics.border.child;
      };
      colors.focusedInactive = {
        border = nord.colors.background.blue;
        background = nord.colors.background.blue;
        text = nord.colors.text.white;
        indicator = nord.graphics.indicator;
        childBorder = nord.graphics.border.child;
      };
      colors.unfocused = {
        border = nord.colors.background.blue;
        background = nord.colors.background.blue;
        text = nord.colors.text.white;
        indicator = nord.graphics.indicator;
        childBorder = nord.graphics.border.child;
      };
      colors.urgent = {
        border = nord.colors.error.red;
        background = nord.colors.error.background.grey;
        text = nord.colors.text.white;
        indicator = nord.graphics.indicator;
        childBorder = nord.graphics.border.child;
      };
      colors.hovered = {
        border = nord.colors.background.teal;
        background = nord.colors.background.blue;
        text = nord.colors.text.white;
        indicator = nord.graphics.indicator;
        childBorder = nord.graphics.border.child;
      };
    };
    initialization = {
      script = "polybar top &";
    };
    styling = {
      font-0 = "RobotoMono Nerd Font:antialias=true:hinting=true;size=10;2";
      padding = 2;
    };
    dimensions = {
      height = 30;
      width = "100%";
    };
    elements = {
      separator = "|";
    };
    colors = {
      background = nord.colors.background.blue;
      foreground = nord.colors.foreground;
    };
  };
in
{
  options = {
    blackmatter = {
      desktop.i3.enable = mkEnableOption "desktop.i3";
    };
  };
  config = mkMerge [
    (mkIf cfg.desktop.i3.enable {
      xsession.enable = true;
      xsession = {
        windowManager = {
          i3 = {
            enable = true;
            config = {
              window.border = 0;
              fonts = [ themes.nord.styling.font-0 ];
              # send alt+d to menu
              menu = "rofi -show drun";
              # terminal = "alacritty";
              terminal = "kitty";
              # if you have polybar active remove default bars configuration
              bars = [ ];
              colors.urgent = themes.nord.globals.colors.urgent;
              colors.focused = themes.nord.globals.colors.focused;
              colors.unfocused = themes.nord.globals.colors.unfocused;
              colors.focusedInactive = themes.nord.globals.colors.focusedInactive;
            };
            extraConfig = ''
              # remove borders
              for_window [class="^.*"] border pixel 0
              for_window [class="^.*"] gaps inner all

              # make the background nord color
              exec_always --no-startup-id xsetroot -solid "${nord.colors.background.blue}"

              # screen locking
              # TODO: for now set directly but move to config file in the future
              bindsym Mod1+Shift+l exec i3lock -c "${nord.colors.i3lock.background.blue}" -u
            '';
          };
        };
      };
      xdg.configFile."i3lock/config".text = ''
        background_color = "${nord.colors.i3lock.background.blue}"
      '';

      services.polybar = with themes.nord;
        {
          enable = true;
          config = {
            "module/date" = {
              internal = 5;
              label = "%date% %time%";
              type = "internal/date";
              date = "%Y-%m-%d";
              time = "%H:%M %Z";
            };
            "bar/top" = {
              monitor = monitors.main.name;
              modules-right = "date";
            } // colors // elements // styling // dimensions;
          };
        } // initialization;

      # enable the rofi launcher
      programs.rofi.enable = true;
      programs.rofi.theme = themes.nord.rofi;
    })
  ];
}
