{
  pkgs,
  ...
}:
{
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      vimdoc
      vim
      lua
      nix
    ];
    settings = {
      auto_install = false;
    };
    languageRegister =
      {
      };
    folding = true;
    nixGrammars = true;
    nixvimInjections = true;
  };
}
