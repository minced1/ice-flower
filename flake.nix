{
	description = "ice-flower: Never's Flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		# nixpkgs.url = "git+file:///home/never/nixpkgs";

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
					(import ./modules)
					(import home-manager.nix)
					musnix.nixosModules.musnix
				];
			};
		};
	};
}
