# getmynixos
My own configure files for NixOS. With it you can rebuild my full environment on any computer with NixOS.

This project is specified for NixOS on WSL, not a NixOS running on a server or a desktop PC, or other Linux distro / Unix-like system / Windows native POSIX layer with a Nix package manager.

## Build
On the NixOS system, simply

```bash
sudo nixos-rebuild switch
```