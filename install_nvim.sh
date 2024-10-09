#!/bin/bash -e

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /home/coder/bin -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:~/bin/nvim-linux64/bin"' | tee /home/coder/.bashrc | tee /home/coder/.zshrc
git clone --depth 1 git@github.com:TKussel/astrovim-config.git /home/coder/.config/nvim
