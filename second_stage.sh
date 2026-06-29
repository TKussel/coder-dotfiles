#!/bin/bash -e

nix profile add nixpkgs#jujutsu
nix profile add nixpkgs#neovim
git clone --depth 1 git@github.com:TKussel/astrovim-config.git /home/coder/.config/nvim || true

source /verbis/functions.sh

# If Samply.Beam not yet present, clone the develop branch
verbis_clone git@github.com:samply/beam develop

# Same for the Bridgehead -- but here, clone the default branch
verbis_clone git@github.com:samply/bridgehead develop

