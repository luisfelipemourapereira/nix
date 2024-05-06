{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../luis/common
    ../common
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = true;
  # blackmatter.desktop.alacritty.config.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron_25_9_0"
  ];
}
