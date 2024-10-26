{
  pkgs,
  ...
}:
{
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      nix
      yaml
      markdown
      elixir
      cpp
      c
      python
      html
    ];
    settings = {
      auto_install = false;
    };
    languageRegister = {
      elixir = [
        "ex"
        "exs"
      ];
    };
    folding = true;
    nixGrammars = true;
    nixvimInjections = true;
  };
}
