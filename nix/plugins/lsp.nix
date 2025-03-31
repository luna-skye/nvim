{ pkgs, helpers, ... }: {
  plugins.lsp = {
    enable = true;

    servers = {
      nixd.enable = true;
      lua_ls.enable = true;
      ts_ls.enable = true;
      gopls.enable = true;
      zls.enable = true;
    };
  };
}
