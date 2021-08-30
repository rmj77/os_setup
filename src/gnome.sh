#!/bin/bash

set -e

# Set favorite apps
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'thunderbird.desktop', 'code_code.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop']"
