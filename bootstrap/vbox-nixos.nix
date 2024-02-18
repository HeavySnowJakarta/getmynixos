# Bootstrap script for NixOS on Virtual Box.

{config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;

    services = {
        openssh = {
            enable = true;
            settings = {
                PermitRootLogin = "yes";
                PasswordAuthentication = true;
            };
        };
    };

    users.users.user = {
        isNormalUser = true;
        description = "user";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];

        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEScz1h6U3ykFZZA7tSf4Vp1PNu4eQDp99dycNSlqGur bians@surface"
        ];
    };

    environment = {
        systemPackages = with pkgs; [
            git
            nano
            wget
            curl
        ];

        variables.EDITOR = "nano";
    };
}