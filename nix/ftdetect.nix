{ ... }:

{
  extraConfigLua = /* lua */ ''
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
      pattern = "*.etlua",
      command = "setfiletype html",
    })
  '';
}
