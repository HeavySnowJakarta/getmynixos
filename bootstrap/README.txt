For some stuck systems without a thing like git, a simple
`configuration.nix` is provided to build a temporary system
without most features.

When these profile are needed, remove the current `configuration.nix`
and `flake.nix`, rename the file matching to the target system type
to `configuration.nix`, then do `sudo nix-rebuild switch`.