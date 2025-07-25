{ pkgs, helpers, ... }:
pkgs.lib.mkMerge (builtins.map (v: import v { inherit pkgs helpers; }) [
  ./barbecue.nix
  ./ccc.nix
  ./cmp.nix
  ./git.nix
  ./lsp.nix
  ./lualine.nix
  ./markdown.nix
  ./mini.nix
  ./multicursors.nix
  ./oil.nix
  ./rainbow-delimiters.nix
  ./snacks.nix
  ./statuscol.nix
  ./todo.nix
  ./tmux.nix
  ./treesitter.nix
  ./trouble.nix
  ./wakatime.nix
  ./web-devicons.nix
  ./whichkey.nix
  ./wilder.nix
  ./yazi.nix
])
