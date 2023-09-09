{
  description = "Never's Flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { nixpkgs, home-manager, musnix, ... }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    
    lib = nixpkgs.lib;
    
  in {
    homeManagerConfigurations = {
      never = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/never/home.nix
        ];
      };
    };
    
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          musnix.nixosModules.musnix
          ./system/configuration.nix
        ];
      };
    };
  };
}
