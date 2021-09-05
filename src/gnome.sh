#!/bin/bash

set -e

# Set favorite apps
gsettings set org.gnome.shell favorite-apps "['gnome-control-center.desktop', 'firefox.desktop', 'thunderbird.desktop', 'code_code.desktop', 'org.gnome.Terminal.desktop']"
gsettings set org.gtk.Settings.FileChooser clock-format '12h'
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.shell.extensions.ding show-trash false
gsettings set org.gnome.shell.extensions.ding show-home false
