# `configure.nix` for NixOS on WSL.

{pkgs, config, ...}:

{
    imports = [
        <nixos-wsl/modules>
    ];

    wsl = {
        enable = true;
        defaultUser = "user";
    };

    system.stateVersion = "unstable";

    users.users = import ./users.nix;
    services = import ./services.nix;
}