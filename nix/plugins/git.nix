{ pkgs, helpers, ... }: {
  plugins.neogit = {
    enable = true;
  };
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
    };
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>gg" "<CMD>Neogit<CR>" "Open Neogit")
  ];

  colorschemes.catppuccin.settings.integrations = {
    neogit = true;
    gitsigns = true;
  };
}
