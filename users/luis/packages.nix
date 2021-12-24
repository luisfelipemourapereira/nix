{ pkgs, lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig
}: {
  home.packages = with pkgs; [
    ripgrep
    xsel
    derivation
    {
      name = "neovim";
      builder = "${bash}/bin/bash";
      args = [ ./builder.sh ];
      system = "x86_64-linux";
    }
  ];
  # jq
  programs.jq.enable = true;
}
