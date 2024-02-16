# Flake core configuration

{
    description = "NixOS flake configuration";

    # For now the only thing flake.input has is the url of source code.
    inputs = import ./config/source_url.nix;

    outputs = {self, nixpkgs, ...}@inputs: {
        nixosConfigurations = import ./interface/host.nix {
            type = (import ./options.nix).type;
            is_NixOS = (import ./options.nix).is_NixOS;
        };
    };
}