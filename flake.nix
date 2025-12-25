{
  description = "NixOS flake for blake.ocf.berkeley.edu vm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, agenix, ... }@inputs: {
    nixosConfigurations.blake = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        agenix.nixosModules.default
      ];
    };
  };
}
