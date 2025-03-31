{ pkgs, helpers, ... }: {
  plugins.ccc = {
    enable = true;
    settings = {
      highlighter = {
        auto_enable = true;
        lsp = true;
        excludes = [ "markdown" ];
      };
      bar_len = 32;
      pickers = [
        "ccc.picker.css_oklch"
        "ccc.picker.css_name"
        "ccc.picker.hex"
      ];
    };
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>c" "<CMD>CccPick<CR>" "Open Color Picker")
  ];
}
