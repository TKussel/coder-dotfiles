#!/bin/bash -e

curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /home/coder/bin -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:~/bin/nvim-linux-x86_64/bin"' | tee /home/coder/.bashrc | tee /home/coder/.zshrc
git clone --depth 1 git@github.com:TKussel/astrovim-config.git /home/coder/.config/nvim
