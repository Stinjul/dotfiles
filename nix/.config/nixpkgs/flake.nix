{
  description = "Home Manager configuration";
  # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # poetry2nix = {
    #   url = "github:nix-community/poetry2nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixgl = {
      url = "github:guibou/nixGL";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixgl, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
      ];
    in
    rec {
      overlays = {
        default = import ./overlay { inherit inputs; };
        nixgl = nixgl.overlay;
      };

      legacyPackages = forAllSystems (system:
        import inputs.nixpkgs {
          inherit system;
          overlays = builtins.attrValues overlays;
          config.allowUnfree = true;
        }
      );

      homeConfigurations = {
        "stinjul@zentoo" = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
