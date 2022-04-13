bindkey '^R' history-incremental-search-backward
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export PATH="~/.bin:$PATH"
