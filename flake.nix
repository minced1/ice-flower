{
	description = "ice-flower: Never's Flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";
		# nixpkgs.url = "git+file:///home/never/nixpkgs";

		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		musnix.url = "github:musnix/musnix";
		musnix.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ nixpkgs, home-manager, musnix, ... }: {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					(import ./modules)

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.never = import ./home-manager/never/home.nix;
					}

					musnix.nixosModules.musnix
				];
			};
		};
	};
}
