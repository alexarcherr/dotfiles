#!/bin/sh

setup_symlinks() {
    ln -s ~/.dotfiles/nvim ~/.config/nvim
}

# install Packer (Linux, MacOS)
setup_packer() {
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

case "$1" in
    packer)
	setup_packer
    ;;
    link)
	setup_symlinks
    ;;
    *)
	echo 'Usage: install_nvim.sh { packer | link }'
	exit 1;
esac

echo -e
success 'All Done.'
