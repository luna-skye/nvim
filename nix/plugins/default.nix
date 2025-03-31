{ pkgs, helpers, ... }: 

let
  enabledPlugins = [
    ./ccc.nix
    ./lualine.nix
    ./oil.nix
    ./snacks.nix
    ./treesitter.nix
    ./whichkey.nix
    ./wilder.nix
  ];

in pkgs.lib.mkMerge (builtins.map
  (v: import v { inherit pkgs helpers; })
enabledPlugins)
