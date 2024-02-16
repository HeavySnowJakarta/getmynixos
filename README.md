# getmynixos
My own configure files for NixOS. With it you can rebuild my full environment on any computer with NixOS.

This project is specified for NixOS on WSL, not a NixOS running on a server or a desktop PC, or other Linux distro / Unix-like system / Windows native POSIX layer with a Nix package manager.

## Build
On the NixOS system, you'll have to initialize `/etc/nix/` as a Git repository to contain the config files.

```bash
# Set the binary cache repository temporarily
sudo nixos-rebuild switch --option substituters "https://nix-community.cachix.org" --option trusted-public-keys "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
# Install Git temporarily
nix-env -i git
# Initialize `/etc/nix/` as a repository
cd /etc/nix
git init .
# Add the GitHub repository as remote and fetch the files
git remote add origin https://github.com/HeavySnowJakarta/getmynixos
git pull origin
# Apply the configuration files
sudo nixos-rebuild switch
```