# Flake core configuration

{
    description = "NixOS flake configuration";

    # For now the only thing flake.input has is the url of source code.
    inputs = {
        # nixpkgs.url = "github:NixOS/nixpkgs/master";
        nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git";
    };

    outputs = {self, nixpkgs, ...}@inputs: {
        nixosConfigurations = import ./interface/host.nix {
            type = (import ./options.nix).type;
            is_NixOS = (import ./options.nix).is_NixOS;
        };
    };
}