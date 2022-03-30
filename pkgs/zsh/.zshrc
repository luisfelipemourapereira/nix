export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
# cause symbols to display in tmux
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export HISTFILE=$HOME/.local/state/.zsh_history
export HISTSIZE=10000000000
export SAVEHIST=10000000000
export PATH=$PATH:~/.poetry/bin
export PATH=$PATH:~/.cargo/env
alias vim="nvim"
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
[ -f $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f $HOME/.zsh/ohmyzsh/lib/completion.zsh ] && source $HOME/.zsh/ohmyzsh/lib/completion.zsh && autoload -Uz compinit
[ -f $HOME/.zsh/ohmyzsh/lib/completion.zsh ] && 
	typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ -f $HOME/.zsh/ohmyzsh/lib/completion.zsh ];then
  if [ $(date +'%j') != $updated_at ]; then
    compinit -i
  else
    compinit -C -i
  fi
  zmodload -i zsh/complist
fi
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:~/.fzf/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH=$PATH:~/.config/node-build/bin
export PATH=$PATH:~/.config/var/alacritty/target/release
export PATH=$PATH:~/.config/var/stylua/bin
export PATH=$PATH:~/.config/ninja/build-cmake
alias luamake=/home/t3rro/.config/var/lua/language-server/3rd/luamake/luamake
export PATH=$PATH:~/.config/var/lua/language-server/bin
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
export PATH=$HOME/.local/bin:$PATH
! [ -d $HOME/.local/bin ] && mkdir -p $HOME/.local/bin
! [ -L ~/.local/bin/bash-language-server ] &&
	ln -s ~/.local/share/nvim/lsp_servers/bash/node_modules/bash-language-server/bin/main.js ~/.local/bin/bash-language-server

# nomad autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/nomad nomad

[ -z $TMUX_RPOJECT ] && TMUX_PROJECT=default
[ -z $TMUX_PLUGINS ] && TMUX_PLUGINS=$TMUX_HOME/plugins
! [ -d $TMUX_HOME ] && mkdir -p $TMUX_HOME
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t $TMUX_PROJECT || tmux new -s $TMUX_PROJECT
fi
