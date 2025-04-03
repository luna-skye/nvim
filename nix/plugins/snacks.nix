{ helpers, ... }: {
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      dashboard = {
        enabled = true;
        preset = {
          header = ''
.   . . . . .-.       .-. . . . . .-.
|   | | |\| |-|      `-. |<   |  |- 
`-- `-' ' ` ` '       `-' ' `  `  `-'
          '';
        };
        sections = [
          {
            section = "header";
            padding = 1;
          }
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            title = "Recent Files";
            section = "recent_files";
            padding = 1;
            indent = 3;
          }
        ];
      };
      dim.enabled = true;
      indent.enable = true;
      git.enabled = true;
      gitbrowse.enabled = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      picker.enabled = true;
      quickfile.enabled = true;
      rename.enabled = true;
      scope.enabled = true;
      scratch.enabled = true;
      scroll.enabled = true;
      terminal.enabled = true;
      toggle = {
        map = { __raw = ''vim.keymap.set''; };
        which_key = true;
        notify = true;
        icon = {
          enabled = " ";
          disabled = " ";
        };
        color = {
          enabled = "green";
          disabled = "yellow";
        };
        wk_desc = {
          enabled = "Disable ";
          disabled = "Enable ";
        };
      };
      win.enabled = true;
      words = {
        debounce = 100;
        enabled = true;
      };
      zen = {
        enabled = true;
      };
    };
  };

  keymaps = [
    # main finders
    (helpers.mkKeymap "n" "<leader>f<space>" "<CMD>lua Snacks.picker.files()<CR>" "Smart Find Files")
    (helpers.mkKeymap "n" "<leader>f," "<CMD>lua Snacks.picker.buffers()<CR>" "Buffers")
    (helpers.mkKeymap "n" "<leader>f/" "<CMD>lua Snacks.picker.grep()<CR>" "Grep")
    (helpers.mkKeymap "n" "<leader>fi" "<CMD>lua Snacks.picker.icons()<CR>" "Icons")
    (helpers.mkKeymap "n" "<leader>fc" "<CMD>lua Snacks.picker.command_history()<CR>" "Command History")
    (helpers.mkKeymap "n" "<leader>fn" "<CMD>lua Snacks.picker.notifications()<CR>" "Notification History")
    (helpers.mkKeymap "n" "<leader>fp" "<CMD>lua Snacks.picker.projects()<CR>" "Projects")
    (helpers.mkKeymap "n" "<leader>fh" "<CMD>lua Snacks.picker.highlights()<CR>" "Color Highlights")

    # git pickers
    (helpers.mkKeymap "n" "<leader>gb" "<CMD>lua Snacks.picker.git_branches()<CR>" "Git Branches")
    (helpers.mkKeymap "n" "<leader>gl" "<CMD>lua Snacks.picker.git_log()<CR>" "Git Log")
    (helpers.mkKeymap "n" "<leader>gL" "<CMD>lua Snacks.picker.git_log_line()<CR>" "Git Log Line")
    (helpers.mkKeymap "n" "<leader>gs" "<CMD>lua Snacks.picker.git_status()<CR>" "Git Status")
    (helpers.mkKeymap "n" "<leader>gS" "<CMD>lua Snacks.picker.git_stash()<CR>" "Git Stash")
    (helpers.mkKeymap "n" "<leader>gd" "<CMD>lua Snacks.picker.git_diff()<CR>" "Git Diff")
    (helpers.mkKeymap "n" "<leader>gf" "<CMD>lua Snacks.picker.git_log_file()<CR>" "Git Log File")

    # zen mode
    (helpers.mkKeymap "n" "<leader>zz" "<CMD>lua Snacks.zen()<CR>" "Zen Mode")
    (helpers.mkKeymap "n" "<leader>zZ" "<CMD>lua Snacks.zoom()<CR>" "Zoom")
    (helpers.mkKeymap "n" "<leader>zd" "<CMD>lua Snacks.dim()<CR>" "Dim")
  ];

  colorschemes.catppuccin.settings.integrations.snacks = {
    enabled = true;
    indent_scope_color = "mauve";
  };
}
