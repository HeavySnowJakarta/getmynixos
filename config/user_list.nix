# A way to get a list of "trusted" users. Used by some cases like
# "wheel user group".

# The parameter type means the type this configuration file is used for.
# e.g. "desktop" or "server" or "wsl" or "win-subsystem"(Cygwin or MSYS2)
# The parameter is_NixOS means whether the OS is completely configured by Nix.

{type, is_NixOS}:

["user"]