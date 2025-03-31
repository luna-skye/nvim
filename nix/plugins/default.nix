{ pkgs, helpers, ... }: 

let
  enabledPlugins = [
    ./oil.nix
    ./snacks.nix
    ./telescope.nix
    ./whichkey.nix
  ];

in pkgs.lib.mkMerge (builtins.map
  (v: import v { inherit pkgs helpers; })
enabledPlugins)
