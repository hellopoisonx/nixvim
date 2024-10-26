{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      nix
      cpp
      c
      python
      yaml
      markdown
      elixir
    ];
    settings = {
      auto_install = false;
    };
    languageRegister = {
      elixir = [
        "exs"
      ];
    };
    folding = true;
    nixGrammars = true;
    nixvimInjections = true;
  };
}
