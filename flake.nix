{
  description = "ice-flower: Never's Flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = inputs@{ nixpkgs, home-manager, musnix, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
      	system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          ./system/audio.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.never = import ./users/never/home.nix;
					}

          musnix.nixosModules.musnix
        ];
      };
    };
  };
}
