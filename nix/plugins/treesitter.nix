{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      indent.enable = true;
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = [ "markdown" ];
      };
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      gitignore dockerfile
      bash fish
      vim vimdoc
      lua luadoc
      yaml toml json
      just
      nix
      javascript jsdoc
      typescript tsx
      html css scss
      svelte vue
      markdown markdown_inline
      gdscript gdshader godot_resource
      go gomod gosum
      nim
      zig
      regex latex norg typst
    ];
  };

  plugins.treesitter-context = {
    enable = true;
    settings = {
      enable = true;
      multiline_threshold = 8;
      min_window_height = 16;
    };
  };

  colorschemes.catppuccin.settings.integrations = {
    treesitter = true;
    treesitter_context = true;
  };
}
