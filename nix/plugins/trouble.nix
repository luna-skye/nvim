{ helpers, ... }: {
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
    };
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>d" "<CMD>Trouble diagnostics open<CR>" "Open Diagnostics")
  ];

  colorschemes.catppuccin.settings.integrations.lsp_trouble = true;
}
