parameters:

{
    nixos = parameters.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            ../../configuration.nix
            ./configuration.nix
        ];
    };
}