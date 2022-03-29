{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  home.sessionVariables = { 
   EDITOR = "neovim"; 
   TERM = "alacritty"; 
  };
}
