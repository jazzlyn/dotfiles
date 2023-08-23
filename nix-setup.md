# install

sudo pacman -Sy nix
sudo systemctl enable nix-daemon
sudo systemctl start nix-daemon
sudo usermod -a -G nix-users user
nix-channel --add <https://nixos.org/channels/nixpkgs-unstable>
nix-channel --update

## run ad-hoc shell with package(s)

nix-shell -p git neovim

## pin packages to create a reproducible environment

nix-shell -p git --pure -I nixpkgs=<https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz>

- --pure # clean shell env
- --I nixpkgs # specifies exact package
