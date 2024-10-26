{
  pkgs,
  lib,
  config,
  ...
}:
let
  grammarPackages = config.grammarPackages;
  languageRegister = config.languageRegister;
in
{
  options.grammarPackages = lib.mkOption {
    type = with lib.types; listOf package;
    default = [ ];
  };
  options.languageRegister = lib.mkOption {
    type = with lib.types; attrsOf (listOf string);
    default = { };
  };
  config = {
    plugins.treesitter = {
      enable = true;

      grammarPackages =
        with pkgs.vimPlugins.nvim-treesitter.builtGrammars;
        [
          bash
          json
          lua
          make
          nix
          yaml
          markdown
        ]
        ++ grammarPackages;
      settings = {
        auto_install = false;
      };
      languageRegister = languageRegister;
      folding = true;
      nixGrammars = true;
      nixvimInjections = true;
    };
  };
}
