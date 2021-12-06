#!/bin/bash

set -e

cp res/.gitignore ~/.
git config --global core.excludesfile ~/.gitignore

git config --global user.name "Johnson, Richard Miles"
git config --global user.email rick_johnson@byu.edu

git config --global core.editor "vim"

### Download git autocomplete script ###
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.bash_environment/git-completion.bash
