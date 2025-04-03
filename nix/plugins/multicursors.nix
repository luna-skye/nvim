{ pkgs, helpers, ... }: {
  plugins.multicursors = { enable = true; };

  keymaps = [
    (helpers.mkKeymap [ "n" "v" ] "<leader>ms" "<CMD>MCstart<CR>" "Start multicursor selection")
  ];
}
