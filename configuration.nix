# Nix core configuration
# The only functions of `configuration.nix` are, enable the feature of
# `flake`, and install the packages relied by this configure project.

{config, pkgs, ...}:

{
    # Enable flakes and nix-command
    nix.settings.experimental-features = [
        "nix-command",
        "flakes"
    ];

    # Core environment configuration
    environment = {
        # Core relied packages
        systemPackages = with pkgs; [
            git
            nano
            wget
            curl
        ];

        # Default editor
        variables.EDITOR = "nano"
    }
}