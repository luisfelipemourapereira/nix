{ pkgs
, lib
, config
, specialArgs
, options
, modulesPath
, nixosConfig
, osConfig
}: {
  home.packages = with pkgs; [
    nodejs
    gnome3.gnome-tweaks
    ripgrep
    xsel
    fzf
    cargo
  ];

  programs.jq.enable = true;
}
