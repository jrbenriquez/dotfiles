#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    # Run the homebrew.sh script
    install/homebrew.sh
else
    echo "Homebrew is already installed."
fi

# Utilities
brew install fzf
brew install bat
brew install fd
brew install ripgrep
brew install xz

#install nvim
install/nvim.sh

#install ohmyzsh
install/ohmyzsh.sh

#install powerlevel10k
install/powerlevel10k.sh

#install pyenv
install/pyenv.sh

# install node and nvm
install/nvm.sh

#install alacritty
install/alacritty.sh

# Install Karabiner Elements
install/karabiner.sh
