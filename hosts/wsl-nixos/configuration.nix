# `configure.nix` for NixOS on WSL.

{pkgs, config, ...}:

{
    # Not working with `flake`
    #imports = [
    #    <nixos-wsl/modules>
    #];

    # Not working weirdly
    #wsl = {
    #    enable = true;
    #    defaultUser = "user";
    #};

    system.stateVersion = "23.11";

    users.users = import ./users.nix {
        config = config;
        pkgs = pkgs;
    };
    services = import ./services.nix;
}