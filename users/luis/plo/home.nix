{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../luis/common
    ../common
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
  # blackmatter.desktop.alacritty.enable = false;
  blackmatter.desktop.alacritty.config.enable = true;
  blackmatter.desktop.monitors = {
    main = {
      name = "DP-2";
      mode = "1920x1080";
      rate = "360";
    };
  };
}
