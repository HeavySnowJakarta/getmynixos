# Nix core configuration
# The only functions of `configuration.nix` are, enable the feature of
# `flake`, and install the packages relied by this configure project.

{config, pkgs, ...}:

{
    # Enable flakes and other experimental features.
    nix.settings = {
        experimental-features =
            ["flakes" "nix-command"];

    #    # Binary cache configuration
    #    trusted-users = ["user"];
    #    sustituters = ["https://cache.nixos.org"];
    #    #trusted-public-keys = import ./config/binary_cache_key.nix;
    };

    # Core environment configuration
    #environment = {
        # Core relied packages
    #    systemPackages = with pkgs; [
    #        git
    #        nano
    #        wget
    #        curl
    #    ];

        # Default editor
        variables.EDITOR = "nano";

        # !Expanded part start
        # system.stateVersion = "23.11";
        #users.users.user = {
        #    isNormalUser = true;
        #    description = "All your base are belong to us.";
        #    extraGroups = [
        #        "wheel"
        #        "networkmanager"
        #    ];

        #    packages = with pkgs;[
        #        fish
        #    ];
        #};
        # !end

        wsl = {
            enable = true;
            defaultUser = "user";
        };
    #};
}