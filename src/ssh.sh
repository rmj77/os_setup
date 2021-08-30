#!/bin/bash

set -e

ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''

echo "Remember to add ssh keys to online git accounts"
