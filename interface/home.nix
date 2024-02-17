# This file chooses the proper `home.nix` for Home Manager according
# to the specific type.

{type, is_NixOS, parameters}:

if
    type == "wsl" and is_NixOS
then
    import ../homes/wsl.nix parameters
else
    abort "No type matched."