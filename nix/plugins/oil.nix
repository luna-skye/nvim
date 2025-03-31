{ pkgs, helpers, ... }: {
  plugins.oil = {
    enable = true;

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;
      columns = [ "permissions" "size" "mtime" "icon" ];

      win_options = {
        winbar = "%{v:lua.require('oil').get_current_dir()}";
      };
      view_options = {
        show_hidden = true;
        natural_order = true;
        is_always_hidden = { __raw = /* lua */ ''
          function(name, _)
            local dir = require("oil").get_current_dir()

            -- if no local dir (like ssh connections), always show
            if not dir then return false end

            -- hide globally hidden files
            if vim.tbl_contains(hidden_files, name) then return true end

            -- hide git ignored files
            if vim.tbl_contains(git_ignored[dir], name) then return true end

            return false
          end
        ''; };
      };

      keymaps = {
        "<C-s>" = false;
        "<C-h>" = false;
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
        "y." = "actions.copy_entry_path";
      };
    };
    
    luaConfig.pre = /* lua */ ''
      local hidden_files = {
        ".git",
        ".direnv",
        ".envrc",
        ".obsidian",
      }

      -- hide git ignored files in oil
      local git_ignored = setmetatable({}, {
        __index = function(self, key)
          local proc = vim.system(
            { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
            { cwd = key, text = true }
          )
          local result = proc:wait()
          local ret = {}
          if result.code == 0 then
            for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
              line = line:gsub("/$", "")
              table.insert(ret, line)
            end
          end

          rawset(self, key, ret)
          return ret
        end
      })
    '';
  };

  keymaps = [
    (helpers.mkKeymap "n" "<leader>e" "<CMD>Oil<CR>" "Open File Explorer")
  ];
}
