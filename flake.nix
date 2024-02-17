# Flake core configuration

{
    description = "NixOS flake configuration";

    # For now the only thing flake.input has is the url of source code.
    inputs = {
        # nixpkgs
        nixpkgs.url = "github:NixOS/nixpkgs/master";
        # nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git";

        # home manager
        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            # The `follows` keyword in inputs is used for inheritance.
            # Here, `inputs.nixpkgs` of home-manager is kept consistent
            # with the `inputs.nixpkgs` of the current flake,
            # to avoid problems caused by different versions of nixpkgs.
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, ...}@inputs: {
        nixosConfigurations = import ./interface/host.nix {
            type = (import ./options.nix).type;
            is_NixOS = (import ./options.nix).is_NixOS;
            parameters = {nixpkgs=nixpkgs};
        };
    };
}