{ pkgs, helpers, ... }: {
  plugins.yazi = {
    enable = true;
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>yy" "<CMD>lua require('yazi').yazi()<CR>" "Open Yazi Explorer (Current File)")
    (helpers.mkKeymap "n" "<leader>yd" "<CMD>lua require('yazi').yazi(nil, vim.fn.getcwd())<CR>" "Open Yazi Explorer (Current Directory)")
  ];
}
