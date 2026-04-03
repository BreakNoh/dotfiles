#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

mkdir -p "$CONFIG"
mkdir -p "$HOME"

backup() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        rm -rf "${1}_backup"
        mv "$1" "${1}_backup"
    fi
}

link() {
    if [[ "$3" == "--backup" ]]; then
        backup "$2"
    fi

    ln -sfn "$1" "$2"
}

link "$DOTFILES/nvim" "$CONFIG/nvim" "$1"
link "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf" "$1"
link "$DOTFILES/zsh/zshrc" "$HOME/.zshrc" "$1"
# link "$DOTFILES/zsh/profile" "$HOME/.zprofile" "$1"
link "$DOTFILES/git/gitconfig" "$HOME/.gitconfig" "$1"
link "$DOTFILES/kitty" "$CONFIG/kitty" "$1"


# instala oh-my-zsh se não tiver instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSLq "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")" "" --unattended &> /dev/null
fi

DIR_ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
DIR_PLUGINS="$DIR_ZSH_CUSTOM/plugins"

instalar_plugin() {
    if [ ! -e "$DIR_PLUGINS/$1" ]; then
        git clone "https://github.com/zsh-users/$1" "$DIR_PLUGINS/$1" -q
    fi
}

instalar_plugin "zsh-autosuggestions"
instalar_plugin "zsh-syntax-highlighting"
