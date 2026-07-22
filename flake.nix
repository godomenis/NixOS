{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qylock.url = "github:Darkkal44/qylock";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs = { self, nixpkgs, home-manager, qylock, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/configuration.nix
        qylock.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.godo = import ./home/default.nix;
        }
      ];
    };
  };
}
