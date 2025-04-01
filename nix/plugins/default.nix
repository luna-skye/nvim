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
    ./statuscol.nix
    ./tmux.nix
    ./treesitter.nix
    ./trouble.nix
    ./web-devicons.nix
    ./whichkey.nix
    ./wilder.nix
  ];

in pkgs.lib.mkMerge [
  (pkgs.lib.mkMerge (builtins.map
    (v: import v { inherit pkgs helpers; })
  enabledPlugins))

  { # misc. configuration
    plugins.nvim-autopairs = { enable = true; };
    plugins.nvim-surround = { enable = true; };
    plugins.sleuth = { enable = true; };
    plugins.multicursors = { enable = true; };

    keymaps = [
      (helpers.mkKeymap [ "n" "v" ] "<leader>ms" "<CMD>MCstart<CR>" "Start multicursor selection")
    ];
  }
]
