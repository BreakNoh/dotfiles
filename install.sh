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

# nvim
echo "== configurando nvim =="
backup "$CONFIG/nvim"
ln -sf "$DOTFILES/nvim" "$CONFIG/nvim"

# tmux
echo "== configurando tmux =="
# instala tpm se não tiver instalado
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "instalando tpm"
	git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

backup "$HOME/.tmux.conf"
ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

# zsh
echo "== configurando zsh =="
backup "$HOME/.oh-my-zsh"
# instala oh-my-zsh se não tiver instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "instalando oh-my-zsh"
	sh -c "$(curl -fsSLq https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &> /dev/null
	echo "instalando plugins "
	PLUGINS="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
	git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS/zsh-autosuggestions -q
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS/zsh-syntax-highlighting -q

fi


backup "$HOME/.zshrc"
backup "$HOME/.zprofile"
ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/profile" "$HOME/.zprofile"
