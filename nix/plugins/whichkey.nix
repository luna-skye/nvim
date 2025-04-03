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
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "Pickers";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Colors";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "Multicursor Selection";
          icon = "󰗧 ";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Split Panes";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>z";
          group = "Zen Mode";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>y";
          group = "Yazi File Explorer";
          icon = " ";
        }
      ];
    };
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>?" "<CMD>WhichKey<CR>" "Local Keymaps (WhichKey)")
  ];

  colorschemes.catppuccin.settings.integrations.which_key = true;
}
