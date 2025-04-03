{ ... }: {
  plugins.navic.enable = true;
  plugins.barbecue = {
    enable = true;
  };

  colorschemes.catppuccin.settings.integrations.barbecue = {
    dim_dirname = true;
    bold_basename = true;
    dim_context = false;
    alt_background = false;
  };
}
