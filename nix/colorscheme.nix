{ helpers, stellae, ... }:

let
  colors = stellae.lib.colors.convertElementTokens
    stellae.lib.elements.hydrogen;
  toHex = hsl: stellae.lib.colors.hslToHex hsl;

in {
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      background.dark = "mocha";
      color_overrides.all = {
        crust    = "#${toHex colors.surface.crust}";
        mantle   = "#${toHex colors.surface.mantle}";
        base     = "#${toHex colors.surface.base}";
        surface0 = "#${toHex colors.surface.surface0}";
        surface1 = "#${toHex colors.surface.surface1}";
        surface2 = "#${toHex colors.surface.surface1}";
        overlay0 = "#${toHex colors.surface.overlay0}";
        overlay1 = "#${toHex colors.surface.overlay1}";
        overlay2 = "#${toHex colors.surface.overlay1}";
        subtext0 = "#${toHex colors.surface.subtext0}";
        subtext1 = "#${toHex colors.surface.subtext1}";
        text     = "#${toHex colors.surface.text}";
      };
      custom_highlights = /* lua */ ''
        function(colors)
          local main_bg = colors.mantle
          local float_bg = colors.base
          return {
            Normal = { bg = main_bg },
            TreesitterContext = { bg = float_bg },
            LineNr = { bg = main_bg },
            SignColumn = { bg = main_bg },
            TreesitterContext = { bg = float_bg },
            TreesitterContextLineNumber = { bg = float_bg },
            WhichKeyFloat = { bg = main_bg },
            SnacksPickerPickWin = { bg = float_bg },
          }
        end
      '';
    };
  };

  highlight = {
    CustomFloatBorder = {
      fg = "#${toHex colors.accent.light_purple}";
      bg = "#${toHex colors.surface.mantle}";
    };
  };

  highlightOverride = {
    FloatBorder = {
      fg = "#${toHex colors.accent.light_purple}";
    };
  };
}
