{ pkgs
, lib
, config
, specialArgs
, options
, modulesPath
, nixosConfig
, osConfig
}: {
  home.packages = with pkgs; [ nodejs ripgrep xsel fzf cargo ];

  programs.jq.enable = true;
}
