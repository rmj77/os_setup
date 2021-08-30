#!/bin/bash

set -e

bash src/bash.sh
bash src/apt.sh
bash src/git.sh
bash src/snap.sh
bash src/vim.sh
bash src/ssh.sh

sudo reboot
