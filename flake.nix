# Flake core configuration

{
    description = "NixOS flake configuration";

    inputs = {
        # NixOS software source. Both original sourceand TUNA mirror
        # are provided.
        # nixpkgs.url = "github:NixOS/nixpkgs/master";
        nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git/";
    };

    outputs = {self, nixpkgs, ...}@inputs: {
        nixosConfigurations = {
            # WSL host
            nixos-wsl = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    # Let the precious config file take effect
                    ./configuration.nix
                ]
            }
        }
    }
}