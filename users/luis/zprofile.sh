bindkey '^R' history-incremental-search-backward
source "$(fzf-share)/key-bindings.zsh"
source "$(fzf-share)/completion.zsh"
! [ -e $HOME/.tmux.conf ] &&
	ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
	[ -z "$TMUX_PROJECT" ] && export TMUX_PROJECT=main
	tmux attach -t $TMUX_PROJECT || tmux new -s $TMUX_PROJECT
fi
export PATH="~/.bin:$PATH"
