{ pkgs, helpers, ... }: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap.preset = "super-tab";
      signature.enabled = true;
    };
  };
}
