{ pkgs, helpers, ... }: {
  plugins.mini = {
    enable = true;
    modules = {
      # https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
      align = {
        mappings = {
          start = "ga";
          start_with_preview = "gA";
        };
      };

      # https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
      pairs = {};

      # https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md
      move = {
        mappings = {
          left = "<M-h>";
          right = "<M-l>";
          down = "<M-j>";
          up = "<M-k>";
          line_left = "<M-h>";
          line_right = "<M-l>";
          line_down = "<M-j>";
          line_up = "<M-k>";
        };
      };

      # https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-splitjoin.md
      splitjoin = {
        mappings = {
          toggle = "gS";
          split = "";
          join = "";
        };
      };

      # https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
      surround = {
        mappings = {
          add = "sa";
          delete = "sd";
          find = "sf";
          find_left = "sF";
          highlight = "sh";
          replace = "sr";
          update_n_lines = "sn";
        };
      };
    };
  };

  colorschemes.catppuccin.settings.integrations.mini = true;
}
