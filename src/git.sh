#!/bin/bash

set -e

cp res/.gitignore ~/.
git config --global core.excludesfile ~/.gitignore

git config --global user.name "Spencer, Paul Whiting"
git config --global user.email pwablito@gmail.com

git config --global core.editor "vim"

### Download git autocomplete script ###
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.local/git-completion.bash
