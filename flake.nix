{
  description = "Luna's opinionated Nixvim configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    stellae.url = "github:luna-skye/stellae";
  };
  outputs = { nixpkgs, nixvim, flake-utils, stellae, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        nixvim' = nixvim.legacyPackages.${system};
        helpers = import ./helpers.nix { inherit pkgs; };

        nixvimModule = import ./nix/nixvim.nix {
          inherit pkgs inputs helpers stellae;
          configDir = ./lua;
        };

        nvim = nixvim'.makeNixvimWithModule { module = nixvimModule; };
      in {
        packages.default = nvim;
        apps.default = {
          type = "app";
          program = "${nvim}/bin/nvim";
        };
      }
    ) // (
      let
        mkNixvim = system: let
          pkgs = import nixpkgs { inherit system; };
          helpers = import ./helpers.nix { inherit pkgs; };
        in import ./nix/nixvim.nix { inherit pkgs inputs system helpers stellae; };
      in {
        # nixosModules.default = import ./nix/module.nix { inherit inputs; };
        homeManagerModules.default = { lib, config, ... }: {
          imports = [
            nixvim.homeManagerModules.nixvim
            ./nix/modules.nix
          ];
        };
        overlays.default = final: prev: {
          zenvim = (mkNixvim prev.system).config.build;
        };
      }
    );
}
