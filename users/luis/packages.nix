{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.packages = with pkgs; [
    ripgrep
    xsel
    {
      name = "neovim";
      builder = "${bash}/bin/bash";
      args = [ ./builder.sh ];
      system = builtins.currentSystem;
    }
  ];
  # jq
  programs.jq.enable = true;
}
