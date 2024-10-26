{
  pkgs,
  lib,
  config,
  ...
}:
let
  grammarPackages = config.nixvim-conf.grammarPackages;
  languageRegister = config.nixvim-conf.languageRegister;
in
{
  options.nixvim-conf.grammarPackages = lib.mkOption {
    type = with lib.types; listOf package;
    default = [ ];
  };
  options.nixvim-conf.languageRegister = lib.mkOption {
    type =
      with lib.types;
      attrsOf (submodule {
        options."*" = lib.mkOption { type = with lib.types; listOf str; };
      });
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
