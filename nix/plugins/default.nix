{ pkgs, helpers, ... }: 

let
  enabledPlugins = [
    ./ccc.nix
    ./cmp.nix
    ./git.nix
    ./lsp.nix
    ./lualine.nix
    ./oil.nix
    ./snacks.nix
    ./treesitter.nix
    ./trouble.nix
    ./web-devicons.nix
    ./whichkey.nix
    ./wilder.nix
  ];

in pkgs.lib.mkMerge (builtins.map
  (v: import v { inherit pkgs helpers; })
enabledPlugins)
