{ lib, config, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  programs.zsh.enable = true;
  programs.zsh.prezto.enable = true;
  programs.zsh.dotDir = ".config/zsh";
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.defaultKeymap = "viins";
  programs.zsh.autocd = false;
  programs.zsh.history.size = 10000000;
  programs.zsh.history.save = 10000000;
  programs.zsh.shellAliases = {
    pbcopy = "xsel --clipboard --input";
    pbpaste = "xsel --clipboard --output";
    vim = "nvim";
  };
  programs.zsh.profileExtra = ''
eval "$(direnv hook zsh)"
'';
}
