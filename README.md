# getmynixos
My own configure files for NixOS. With it you can rebuild my full environment on any computer with NixOS.

This project is specified for NixOS on WSL, not a NixOS running on a server or a desktop PC, or other Linux distro / Unix-like system / Windows native POSIX layer with a Nix package manager.

## Build
On the NixOS system, you'll have to initialize `/etc/nix/` as a Git repository to contain the config files.

```bash
# Set the binary cache repository temporarily
sudo nixos-rebuild switch --option substituters "https://nix-community.cachix.org" --option trusted-public-keys "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
# Install Git temporarily
nix-shell -p git
# Initialize `/etc/nix/` as a repository
cd /etc/nixos
sudo git init . -b main
sudo git add .
# Add the GitHub repository as remote and fetch the files
sudo git remote add origin https://github.com/HeavySnowJakarta/getmynixos
git pull origin
# Apply the configuration files
sudo nixos-rebuild switch
```

## File Structure

```
.
├config             # Global configurations, like urls and keys of binary cache repositories.
├hosts              # Real `configuration.nix` for each cases this project used for.
├interface
├homes              # Not enabled yet. Works with home manager.
├bootstrap          # Not related to the main part. Not for daily systems.
├apps               # Not enabled yet.
|
├configuration.nix  # Calls `flake` and install most-needed packages.
├flake.nix          # Entrance of `flake`, only calls `interface`s.
├options.nix        # Defines what this project is used for.
└...
```

The specific functions of the directories:

### `config`

While `./options.nix` stores the most basic configurations of the project, `./config/*.nix` stores the more specific options, like whether to use a mirror repository, and which experimental features of Nix to enable.

### `hosts`

`./hosts/*/default.nix` defines the specific `flake` hosts. The _real_ `configuration.nix` for each host locales on `./hosts/*/configuration.nix`, and the user settings as well as services lie on `./hosts/*/services.nix` and `./hosts/*/users.nix`

### `interface`

`./flake.nix` and home manager only call `./interface/*.nix`. They send the types (like `server`, `desktop` or `wsl`) stored at `./options.nix` to `./interface/*.nix`, and then `./interface/*.nix` decides which profile of `./hosts/*/` or `./homes/*` to use according to the options.