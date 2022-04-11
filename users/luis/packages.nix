{ pkgs
, lib
, config
, specialArgs
, options
, modulesPath
, nixosConfig
, osConfig
}: {
  home.packages = with pkgs; [ ripgrep xsel fzf cargo ];

  programs.jq.enable = true;
}
