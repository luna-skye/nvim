{ ... }: {
  plugins.lsp = {
    enable = true;

    servers = {
      nil_ls.enable = true;
      lua_ls.enable = true;
      ts_ls.enable = true;
      gopls.enable = true;
      zls.enable = true;
    };
  };
}
