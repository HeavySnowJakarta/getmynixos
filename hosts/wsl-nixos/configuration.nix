# `configure.nix` for NixOS on WSL.

{pkgs, config, ...}:

{
    # Not working with `flake`
    #imports = [
    #    <nixos-wsl/modules>
    #];

    #wsl = {
    #    enable = true;
    #    defaultUser = "user";
    #};

    system.stateVersion = "23.11";

    users.users = import ./users.nix;
    services = import ./services.nix;
}