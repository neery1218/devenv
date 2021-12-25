#!/bin/bash

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ "$(uname)" == "Linux" ]]; then
	sudo apt install neovim fzf silversearcher-ag
fi

# my config files
cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/
