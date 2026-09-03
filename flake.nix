{
  description = "my NixOS Flake";

  nixConfig = {
	  extra-substituters = [ "https://noctalia.cachix.org" ];
	  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
	};
 
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
     url = "github:nix-community/home-manager";
    };
  zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    }; 
  };
    noctalia = {
     url = "github:noctalia-dev/noctalia/cachix";
    }; 
  };
 
  outputs = inputs@{ nixpkgs, home-manager, ...}: {
   nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; }; #Pass the inputs dependencies to all modules below
     modules = [
       ./configuration.nix
       home-manager.nixosModules.home-manager
       {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
 	  home-manager.backupFileExtension = "backup";
          home-manager.users.adautohro = ./home.nix; 
       }
     ];
     };
    };
   };
}
