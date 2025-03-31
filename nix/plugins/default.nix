{ pkgs, helpers, ... }: 

let
  enabledPlugins = [
    ./telescope.nix
    ./whichkey.nix
  ];

in pkgs.lib.mkMerge (builtins.map
  (v: import v { inherit pkgs helpers; })
enabledPlugins)
