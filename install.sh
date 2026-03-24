#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

mkdir -p "$CONFIG"

# salva backup caso config já exista
backup() {
	if [ -e "$1" ] && [ ! -L "$1" ]; then
		echo "Backup salvo em ${1}_backup"
		rm -rf "${1}_backup"
		mv "$1" "${1}_backup"
	fi
}

backup "$CONFIG/nvim"
ln -sf "$DOTFILES/nvim" "$CONFIG/nvim"
