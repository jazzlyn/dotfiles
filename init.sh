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

# check if pacman exists
is_arch() {
  command -v pacman &> /dev/null
}

# install yay if on arch and not present
if is_arch; then
  if ! check_command yay; then
    # clean up existing directory if exists
    [ -d "/tmp/yay" ] && rm -rf /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    yes | makepkg -si
    rm -rf /tmp/yay
  fi
fi

# install mise if not present
if ! check_command mise; then
  if is_arch; then
    yay -Syu --needed --noconfirm mise
  else
    curl https://mise.run | sh
  fi
fi

# activate mise
~/.local/bin/mise activate --shims

if [ -n "${WEB_HOST}" ]; then
  echo "WEB_HOST is set. running workstation setup..."
  task -d ~/dotfiles install:workstation
fi
