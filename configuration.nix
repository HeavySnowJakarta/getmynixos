# Nix core configuration
# The only functions of `configuration.nix` are, enable the feature of
# `flake`, and install the packages relied by this configure project.

{config, pkgs, ...}:

{
    # Enable flakes and other experimental features.
    nix.settings = {
        experimental-features =
            ["flakes"]
            ++
            import ./config/nix_exp_features;

        # Binary cache configuration
        trusted-users = import ./config/user_list.nix;
        sustituters = import ./config/binary_cache_url.nix;
        trusted-public-keys = import ./config/binary_cache_key.nix;
    }

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