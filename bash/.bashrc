if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export EDITOR="nvim"
export PAGER="bat"

alias cd='z'
alias ls='lsd'
alias ll="lsd -l"
alias la="lsd -a"
alias lla="lsd -la"

alias vi="nvim"

eval "$(zoxide init bash)"

NOME_SESSAO_TMUX="padrão"

if [ -z "$TMUX" ]; then
    tmux attach -t "$NOME_SESSAO_TMUX" &>/dev/null || tmux new -s "$NOME_SESSAO_TMUX"
fi
