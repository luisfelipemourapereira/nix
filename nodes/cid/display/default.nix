{ config, pkgs, inputs, ... }: { 
  services.yabai.enable = false;
  services.yabai.enableScriptingAddition = true;
  services.yabai.package = pkgs.yabai;
  services.yabai.config = {
    enable = true;
    sticky = "on";
    mouse_follows_focus = "off";
    focus_follows_mouse = "autoraise";
    window_placement = "second_child";
    window_opacity = "off";
    window_opacity_duration = 0.0;
  };

  services.skhd.enable = false;
  services.skhd.package = pkgs.skhd;
  services.skhd.skhdConfig = ''
    # move window focus
    alt - h : yabai -m window --focus west
    alt - j : yabai -m window --focus south
    alt - k : yabai -m window --focus north
    alt - l : yabai -m window --focus east

    # move windows
    shift + alt - h : yabai -m window --swap west
    shift + alt - j : yabai -m window --swap south
    shift + alt - k : yabai -m window --swap north
    shift + alt - l : yabai -m window --swap east
  '';

}
