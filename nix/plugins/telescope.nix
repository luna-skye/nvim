{ pkgs, helpers, ... }: {
  plugins.telescope.enable = true;

  keymaps = [
    (helpers.mkKeymap "n" "<leader>ff" "<CMD>Telescope find_files<CR>" "Telescope Find Files")
    (helpers.mkKeymap "n" "<leader>fg" "<CMD>Telescope live_grep<CR>" "Telescope Live Grep")
    (helpers.mkKeymap "n" "<leader>fb" "<CMD>Telescope buffers<CR>" "Telescope Buffers")
    (helpers.mkKeymap "n" "<leader>fs" "<CMD>Telescope git_status<CR>" "Telescope Git Status")
    (helpers.mkKeymap "n" "<leader>fc" "<CMD>Telescope git_commits<CR>" "Telescope Git Commits")
  ];
}
