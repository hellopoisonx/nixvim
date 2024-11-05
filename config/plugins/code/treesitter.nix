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
      cpp
      c
      python
      html
      heex
      eex
      elixir
      html
      css
      scss
      javascript
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
