#!/bin/bash

set -e

if [ -f ~/.ssh/id_rsa ]; then
    echo "SSH keys already exists"
else
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
fi

echo "Remember to add ssh keys to online git accounts"
