{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  programs.zsh.enable = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.enableAutosuggestions = false;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.autocd = false;
  programs.zsh.history.size = 10000000;
  programs.zsh.history.save = 10000000;
  programs.zsh.shellAliases = {
    pbcopy = "xsel --clipboard --input";
    pbpaste = "xsel --clipboard --output";
    vim = "nvim -u ~/.config/nvim/init.lua";
  };

  programs.zsh.prezto.enable = false;

  programs.zsh.zplug.enable = false;
}
