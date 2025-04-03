{ pkgs, helpers, ... }: {
  plugins.statuscol = {
    enable = true;
    settings = {
      clickmod = "c";
      ft_ignore = null;
      relculright = true;
      setopt = true;

      segments = let
        not_empty = { __raw = "require('statuscol.builtin').not_empty"; };
        foldfunc = { __raw = "require('statuscol.builtin').foldfunc"; };
        lnumfunc = { __raw = "require('statuscol.builtin').lnumfunc"; };
      in [
        { click = "v:lua.ScFa"; text = [ " " foldfunc ]; }
        {
          sign = { namespace = [ ".*" ]; colwidth = 1; wrap = true; auto = true; };
          click = "v:lua.ScSa";
        }
        {
          click = "v:lua.ScLa";
          condition = [ true not_empty ];
          text = [ lnumfunc " " ];
        }
        {
          sign = { namespace = [ "gitsigns" ]; colwidth = 2; wrap = true; };
          click = "v:lua.ScSa";
        }
      ];
    };
  };
}
