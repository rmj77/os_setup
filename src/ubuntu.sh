#!/bin/bash

set -e

bash src/bash.sh
bash src/chrome.sh
bash src/apt.sh
bash src/git.sh
bash src/gnome.sh
bash src/vim.sh
bash src/ssh.sh
bash src/snap.sh

sudo reboot
