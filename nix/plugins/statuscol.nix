{ pkgs, helpers, ... }: {
  plugins.statuscol = {
    enable = true;
    settings = {
      clickmod = "c";
      ft_ignore = null;
      relculright = true;

      segments = let
        empty = { text = [ " " ]; };
      in [
        (empty)
        { click = "v:lua.ScFa"; text = [ " " "%C" ]; }
        { click = "v:lua.ScSa"; text = [ " " "%s" ]; }
        (empty)
        {
          click = "v:lua.ScLa";
          condition = [ true { __raw = "require('statuscol.builtin').not_empty"; } ];
          text = [ { __raw = "require('statuscol.builtin').lnumfunc"; } " " ];
        }
        {
          sign = { namespace = [ "gitsigns" ]; colwidth = 1; wrap = true; };
          click = "v:lua.ScSa";
        }
        { text = [ " " ]; condition = [ true { __raw = "require('statuscol.builtin').not_empty"; } ]; }
      ];
    };
  };
}
