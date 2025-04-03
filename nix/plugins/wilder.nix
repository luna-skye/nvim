{ ... }: {
  plugins.wilder = {
    enable = true;

    modes = [ ":" "/" ];
    pipeline = [ /* lua */ ''
      wilder.branch(
        wilder.cmdline_pipeline({
          language = "python",
          fuzzy = 2
        }),
        wilder.python_search_pipeline({
          pattern = wilder.python_fuzzy_pattern(),
          sorter = wilder.python_difflib_sorter(),
          engine = "re"
        })
      )
    ''];
    renderer = /* lua */ ''
      wilder.popupmenu_renderer(
        wilder.popupmenu_palette_theme({
          border = 'single',
          max_height = '50%',
          min_height = 0,
          prompt_position = 'top',
          reverse = 0,

          left = {
            ' ', wilder.popupmenu_devicons(),
            wilder.popupmenu_buffer_flags({
              flags = ' a + ',
              icons = {['+'] = '', a = '', h = ''}
            })
          },
          right = { ' ', wilder.popupmenu_scrollbar() },

          highlighter = {
            wilder.basic_highlighter(),
            wilder.pcre2_highlighter(),
            wilder.lua_fzy_highlighter(),
          },
          highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', {
              {a=1},{a=1},
              { foreground = vim.api.nvim_get_hl(0, { name = "Keyword" }).fg }
            })
          }
        })
      )
    '';
  };
}
