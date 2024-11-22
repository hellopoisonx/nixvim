{
  performance.combinePlugins.enable = true;
  vimAlias = true;
  viAlias = true;
  luaLoader.enable = true;
  clipboard = {
    register = "unnamedplus";
    providers.xclip.enable = true;
  };
  opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    ignorecase = true;
    smartcase = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    smarttab = true;
    cursorline = true;
    ruler = true;
    timeoutlen = 300;
  };

  extraConfigLua = # lua
    ''
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    '';
  globals.mapleader = " ";
  colorschemes.catppuccin.enable = true;
}
