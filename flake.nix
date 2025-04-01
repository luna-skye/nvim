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
        devShells.default = pkgs.mkShell {
          packages = [ nvim ];
        };
      }
    );
}
