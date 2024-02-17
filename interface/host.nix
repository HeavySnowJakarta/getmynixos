# NixOS flake has a host for each machine. Here, available hosts are
# defined on directory `hosts`. This file is to decide which one to use
# due to `options.nix`.

# parameters includes `nixpkgs`.

{type, is_NixOS, parameters}:

if
    type=="wsl" && is_NixOS
then
    import ../hosts/wsl-nixos parameters
else
    abort "No type matched."