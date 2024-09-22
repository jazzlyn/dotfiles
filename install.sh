#!/bin/bash

# install yay

git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si

# install more initial needed packages
yay -Syu --needed --noconfirm \
  age \
  alacritty \
  atool \
  autorandr \
  azure-cli-bin \
  barrier \
  base \
  base-devel \
  bluez-utils \
  cups \
  direnv \
  discord \
  dmenu2 \
  docker \
  docker-buildx \
  flameshot \
  flux-bin \
  galculator \
  git \
  gnome-keyring \
  google-chrome \
  google-cloud-cli \
  google-cloud-cli-gke-gcloud-auth-plugin \
  hpuld \
  htop \
  i3blocks \
  i3blocks-contrib-git \
  i3lock \
  i3status \
  i3-wm \
  intel-ucode \
  k9s \
  kind-bin \
  kubectl \
  linux \
  linux-firmware \
  mise-bin \
  neovim \
  networkmanager \
  network-manager-applet \
  networkmanager-openvpn \
  nix \
  noto-fonts-emoji \
  nvm \
  obsidian-bin \
  openssh \
  openvpn \
  pavucontrol-qt \
  playerctl \
  postman-bin \
  ranger \
  seahorse \
  sops \
  spaceship-prompt \
  syncthing \
  sysstat \
  tig \
  tree \
  ttf-dejavu-nerd \
  ttf-inconsolata-go-nerd \
  unzip \
  vim \
  visual-studio-code-bin \
  w3m \
  xorg-server \
  xorg-xinit \
  xorg-xrandr \
  zsh \
  zsh-completions \
  zsh-nix-shell \
  zsh-syntax-highlighting

# Reconfiguration

## use zsh

chsh -s /usr/bin/zsh

# SYMLINKS

# map secrets
[[ -d ~/.secrets/aws ]] && ln -rs ../.secrets/aws ~/.
[[ -f ~/.secrets/github/base.conf ]] && ln -rs ../.secrets/github/base.conf ~/.gitconfig
[[ -f ~/.secrets/github/strg.conf ]] && mkdir -p ~/projects/strg && ln -rs ../.secrets/github/strg.conf ~/projects/strg/.gitconfig
[[ -d ~/.secrets/kube ]] && ln -rs ../.secrets/kube/config ~/.kube/config
[[ -d ~/.secrets/sops ]] && ln -rs ../.secrets/sops ~/.config
[[ -d ~/.secrets/ssh ]] && ln -rs ../.secrets/ssh ~/.

# map base config

ln -rs zsh/.zshenv ~/
ln -rs zsh/.zshrc ~/
ln -rs k9s ~/.config/

ln -rs gitconfig/.git_templates ~/
ln -rs gitconfig/.gitignore ~/.gitignore

ln -rs xinitrc ~/.xinitrc

# map apps

if command -v alacritty > /dev/null 2>&1; then
  ln -rs alacritty ~/.config/
fi

if command -v autorandr > /dev/null 2>&1; then
  ln -rs autorandr ~/.config/
fi

if command -v docker > /dev/null 2>&1; then
  mkdir -p ~/.docker
  ln -rs docker/config.json ~/.docker/config.json
fi

if command -v i3 > /dev/null 2>&1; then
  ln -rs i3 ~/.config/
  ln -rs i3blocks ~/.config/
fi

if command -v k9s > /dev/null 2>&1; then
  ln -rs k9s/plugin.yml ~/.config/k9s/plugin.yml
fi

if command -v mise > /dev/null 2>&1; then
  ln -rs mise ~/.config/
fi

if command -v nix > /dev/null 2>&1; then
  ln -rs nix ~/.config/
fi

if command -v nvim > /dev/null 2>&1; then
  mkdir -p ~/.config/nvim
  ln -rs nvim/init.vim ~/.config/nvim
  ln -rs nvim/init.vim ~/.vimrc
fi

if command -v pacman > /dev/null 2>&1; then
  mkdir -p ~/.config/pacman
  ln -rs makepkg.conf ~/.config/pacman/makepkg.conf
fi

if command -v pulseaudio > /dev/null 2>&1; then
  mkdir -p ~/.config/pulse
  ln -rs pulse/default.pa ~/.config/pulse/default.pa
fi

if command -v ranger > /dev/null 2>&1; then
  ln -rs ranger/commands.py ~/.config/ranger/commands.py
  ln -rs ranger/rc.conf ~/.config/ranger/rc.conf
  ln -rs ranger/scope.sh ~/.config/ranger/scope.sh
fi

if command -v yay > /dev/null 2>&1; then
  ln -rs yay/config.json ~/.config/yay/config.json
fi
