#!/bin/bash
set -ex

# Tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]
then
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ "$(uname)" == "Linux" ]]; then
	sudo apt-get update
	sudo apt-get install -y \
	    apt-transport-https \
	    curl \
	    software-properties-common \
	    fzf \
	    silversearcher-ag \
	    build-essential \
	    wget \
	    tmux \
	    htop \
			libssl-dev \
			pkg-config \
			neovim
	    
			sudo apt-get install -y apt-transport-https ca-certificates gnupg
			sudo apt-get install -y python3 python3-dev python3-venv python3-pip
fi

# install python
# wget https://bootstrap.pypa.io/get-pip.py
# sudo python3 get-pip.py

# install node
echo "Installing node..."
# installing from source takes too long (especially on aws micro instances) so lets do this instead
# curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# my config files
cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/

git config --global core.editor "nvim"

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust-install.sh
source rust-install.sh -y

# install golang
# wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
# sudo ln -s /usr/local/go/bin/go /usr/bin/go

# pip3 install --upgrade pip
# pip3 install -r requirements.txt

# install neovim
# sudo apt g
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# ./squashfs-root/AppRun --version
# mv squashfs-root /
# ln -s /squashfs-root/AppRun /usr/bin/nvim

# cd ~/.vim/plugged/vim-hexokinase
# make hexokinase
# cd -

# install vim-plug and coc plugins
nvim -s setup.vim
