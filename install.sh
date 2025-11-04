#!/bin/bash -e

DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 sudo DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt update -y
DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 sudo DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 sudo DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 sudo DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt install software-properties-common -y
source /verbis/functions.sh

verbis_defaults_main
verbis_symlink_cache_dir git
sudo ln -ds /mnt/cache/bridgehead /etc || true
rm -rf /home/coder/.cargo/registry
verbis_defaults_rust

script_dir=$(dirname "$(readlink -f "$0")")
# Yanked from https://github.com/bstollnitz/dotfiles/blob/main/install.sh
create_symlinks() {
    # Get the directory in which this script lives.
    

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks || true

sudo apt-add-repository -y ppa:fish-shell/release-3
DEBIAN_FRONTEND=noninteractive sudo DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt install fish python3-pip gh -y
sudo chsh -s $(which fish)
sudo usermod -s $(which fish) coder
mkdir -p ~/.config/fish
ln -s $script_dir/config.fish ~/.config/fish/config.fish || true



stow -t ~ gitconfig
stow -t ~ bashconfig

mkdir -p ~/bin

source ./install_nvim.sh

source $HOME/.cargo/env
cargo binstall ripgrep bat prmt tre-command -y
#cargo binstall starship
#ln -s $script_dir/starship.toml ~/.config/starship.toml || true

source $HOME/.profile

# If Samply.Beam not yet present, clone the develop branch
verbis_clone git@github.com:samply/beam develop

# Same for the Bridgehead -- but here, clone the default branch
verbis_clone git@github.com:samply/bridgehead develop
