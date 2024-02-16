# This file defines how many users does WSL has.

# Default settings for all users.
let
    default = {
        isNormalUser = true;
        description = "All your base are belong to us.";
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
    };

# Each user's specific settings.
in
    {
        user = default ++ {
            packages = with pkgs; [
                fish
            ]
        }
    }