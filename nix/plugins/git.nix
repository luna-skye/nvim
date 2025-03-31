{ pkgs, helpers, ... }: {
  plugins.neogit = {
    enable = true;
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>gg" "<CMD>Neogit<CR>" "Open Neogit")
  ];
}
