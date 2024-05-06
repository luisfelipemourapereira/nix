{ outputs, ... }:
{
  imports = [
    outputs.homeManagerModules.blackmatter
    ../../luis/common
    ../common
  ];
  blackmatter.programs.nvim.enable = true;
  blackmatter.shell.enable = true;
  blackmatter.desktop.enable = false;
    programs.fcitx5 = {
    enable = true;

    # Configure the addons and other settings according to your needs
    addons = with pkgs.fcitx5-addons; [
      mozc
      # Add additional addons as needed
    ];

    # Set environment variables necessary for `fcitx5` integration
    environment = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };

    # Optional: Specify additional configuration
    config = ''
      [Addon]
      PreeditEnhance=True
    '';
  };
  # blackmatter.desktop.alacritty.config.enable = true;
  # nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  # ];
}
