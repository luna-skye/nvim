{ pkgs, helpers, ... }:
pkgs.lib.mkMerge (builtins.map (v: import v { inherit pkgs helpers; }) [
  ./ccc.nix
  ./cmp.nix
  ./git.nix
  ./lsp.nix
  ./lualine.nix
  ./mini.nix
  ./multicursors.nix
  ./oil.nix
  ./snacks.nix
  ./statuscol.nix
  ./tmux.nix
  ./treesitter.nix
  ./trouble.nix
  ./web-devicons.nix
  ./whichkey.nix
  ./wilder.nix
])
