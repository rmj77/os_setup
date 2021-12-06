#!/bin/bash

set -e

if [ -f ~/.profile ]; then
    rm ~/.profile
fi

if [ -f ~/.bash_logout ]; then
    rm ~/.bash_logout
fi

if [ -f ~/.bash_profile ]; then
    rm ~/.bash_profile
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

mkdir -p ~/.bash_environment
sudo mkdir -p ~root/.bash_environment

cp res/.bashrc ~/.bashrc
cp res/.bash_profile ~/.bash_profile

sudo cp res/.bashrc ~root/.
sudo cp res/.bash_profile ~root/.

# Default file to avoid "no such file or directory" errors
touch ~/.bash_environment/default

# Default file to avoid "no such file or directory" errors
sudo touch ~root/.bash_environment/default
