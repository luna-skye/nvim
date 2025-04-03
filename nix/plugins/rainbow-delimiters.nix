{ pkgs, helpers, ... }: {
  plugins.rainbow-delimiters = {
    enable = true;
  };
  
  colorschemes.catppuccin.settings.integrations.rainbow_delimiters = true;
}
