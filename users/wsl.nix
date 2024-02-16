# This file defines a single user specified for a WSL system.

{config, pkgs, ...}:

{
    # Basic user info
    home = {
        username = "user";
        homeDirectory = "/home/user/"
    }
}