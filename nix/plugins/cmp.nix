{ pkgs, helpers, ... }: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap.preset = "super-tab";
      signature.enabled = true;
    };
  };

  colorschemes.catppuccin.settings.integrations.blink_cmp = true;
}
