{ pkgs, helpers, ... }: {
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      indent.enable = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      picker.enabled = true;
      quickfile.enabled = true;
      scope.enable = true;
      statuscolumn.enabled = true;
      words = {
        debounce = 100;
        enabled = true;
      };
    };
  };
}
