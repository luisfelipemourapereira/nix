{ outputs, pkgs, ... }:
{
  home.stateVersion = "23.11";
  home.username = "luis";
  home.homeDirectory = "/home/luis";
  # imports = [
  #   outputs.homeManagerModules.blackmatter
  #   ../../luis/common
  #   ../common
  # ];
  # nixpkgs.overlays = [
  #   (self: super: {
  #     fcitx-engines = self.fcitx5;
  #   })
  # ];
  # blackmatter.programs.nvim.enable = true;
  # blackmatter.shell.enable = true;
  # blackmatter.desktop.enable = false;
  # blackmatter.desktop.alacritty.config.enable = true;
  # nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  # ];
}
