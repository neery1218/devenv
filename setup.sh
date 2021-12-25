#!/bin/bash

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ "$(uname)" == "Linux" ]]; then
	sudo apt-get update
	sudo apt-get install -y \
	    apt-transport-https \
	    curl \
	    software-properties-common \
	    neovim \
	    fzf \
	    silversearcher-ag \
	    build-essential \
	    ccls
fi

# install node
echo "Installing node..."
# installing from source takes too long (especially on aws micro instances) so lets do this instead
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# my config files
cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/
