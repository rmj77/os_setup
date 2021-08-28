#!/bin/bash

./bash.sh
./vim.sh
./ssh.sh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git
brew install cmake
brew install rustup
rustup init

./git.sh
