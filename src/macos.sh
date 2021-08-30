#!/bin/bash

set -e

bash src/bash.sh
bash src/vim.sh
bash src/ssh.sh

# Install homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git
brew install cmake
brew install rustup
rustup init

bash src/git.sh
