# NixOS flake has a host for each machine. Here, available hosts are
# defined on directory `hosts`. This file is to decide which one to use
# due to `options.nix`.

{type, is_NixOS}:

if
    type=="wsl" and is_NixOS
then
    import ../hosts/wsl-nixos
else
    abort "No type matched."