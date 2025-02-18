#!/bin/bash

# exit on error
set -e

check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "$1 not found, installing..."
    return 1
  else
    echo "$1 already installed"
    return 0
  fi
}

# install yay if not present
if ! check_command yay; then
  # clean up existing directory if exists
  [ -d "/tmp/yay" ] && rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  yes | makepkg -si
  rm -rf /tmp/yay
fi

# install mise if not present
if ! check_command mise; then
  yay -Syu --needed --noconfirm mise
  eval "$(mise activate bash)"
else
  eval "$(mise activate bash)"
fi
