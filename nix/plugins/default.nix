{ pkgs, helpers, ... }: 

let
  enabledPlugins = [
    ./lualine.nix
    ./oil.nix
    ./snacks.nix
    ./telescope.nix
    ./treesitter.nix
    ./whichkey.nix
  ];

in pkgs.lib.mkMerge (builtins.map
  (v: import v { inherit pkgs helpers; })
enabledPlugins)
