# Bootstrap script for WSL system with NixOS installed.

{config, pkgs, ...}:

{
    # Basic settings for WSL
    imports = [
        <nixos-wsl/modules>
    ];
    wsl = {
        enable = true;
        defaultUser = "user";
    }
    system.stateVersion = "23.11";

    # Source repositories
    trusted-users = import ./config/user_list.nix;
    sustituters = import ./config/binary_cache_url.nix;
    trusted-public-keys = import ./config/binary_cache_key.nix;

    # Environment Configuration
    environment = {
        systemPackages = with pkgs; [
            git
            wget
            curl
            nano
        ];

        variables.EDITOR = "nano";
    };
}