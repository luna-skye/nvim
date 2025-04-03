{ pkgs, helpers, ... }: {
  plugins.render-markdown = {
    enable = true;
  };

  colorschemes.catppuccin.settings.integrations.render_markdown = true;
}
