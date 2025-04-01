{ pkgs
, inputs
, configDir
, helpers
, stellae
, ... }:

{
  config = pkgs.lib.mkMerge [
    {
      viAlias = true;
      vimAlias = true;

      extraConfigLua = builtins.readFile "${configDir}/init.lua";
      opts = {
        termguicolors = true;
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        ignorecase = true;
        smartcase = true;
        ruler = true;
        cursorline = true;
        expandtab = true;
        scrolloff = 8;
        encoding = "UTF-8";
        title = true;
        hidden = true;
        ttimeoutlen = 0;
        wildmenu = true;
        showcmd = true;
        showmatch = true;
        inccommand = "split";
        splitright = true;
        splitbelow = true;
        completeopt = "menuone,noselect";
        undofile = true;
        mousemoveevent = true;
        autoindent = true;
        cindent = true;
      };

      extraPackages = [
        pkgs.ripgrep
        pkgs.fd
      ];
    }
    (import ./colorscheme.nix { inherit helpers stellae; })
    (import ./keymaps.nix { inherit helpers; })
    (import ./plugins/default.nix { inherit pkgs helpers; })
  ];
}
