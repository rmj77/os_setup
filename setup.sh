#!/bin/bash

set -e

cd `mktemp -d`
wget https://github.com/pwablito/os_setup/archive/refs/heads/master.zip -O setup.zip
unzip setup.zip
cd os_setup-master


if [ "`uname`" == "Darwin" ]; then
    bash src/macos.sh
elif [ "`uname`" == "Linux" ]; then
    ### TODO Add more checks here for distros
    bash src/ubuntu.sh
fi
