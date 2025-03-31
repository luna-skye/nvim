{ pkgs, helpers, ... }: {
  plugins.which-key = {
    enable = true;
    settings = {
      icons = {
        breadcrumb = "  ";
        group = " + ";
        separator = " > ";
      };
      replace = {
        desc = [
          [ "<space>"        "SPACE"     ]
          [ "<leader>"       "SPACE"     ]
          [ "<[cC][rR]>"     "RETURN"    ]
          [ "<[tT][aA][bB]>" "TAB"       ]
          [ "<[bB][sS]>"     "BACKSPACE" ]
        ];
      };
    };
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>?" "<CMD>WhichKey<CR>" "Local Keymaps (WhichKey)")
  ];
}
