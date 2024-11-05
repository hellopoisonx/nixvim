{
  lib,
  pkgs,
  config,
  ...
}:
let
  ft = config.conform.formatters_by_ft;
  formatters = config.conform.formatters;
in
{
  options.conform.formatters_by_ft = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  options.conform.formatters = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          cmake = [ "cmake_format" ];
          zsh = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          lua = [ "stylua" ];
          elixir = [ "mix" ];
          html = [ "superhtml" ];
          python = [ "autopep8" ];
          "nix" = [ "nixfmt" ];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        } // ft;
        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;
        formatters = {
          shellcheck = {
            command = lib.getExe pkgs.shellcheck;
          };
          shfmt = {
            command = lib.getExe pkgs.shfmt;
          };
          shellharden = {
            command = lib.getExe pkgs.shellharden;
          };
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
          nixfmt = {
            command = lib.getExe' pkgs.nixfmt-rfc-style "nixfmt";
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
          };
          superhtml = {
            command = lib.getExe' pkgs.superhtml "superhtml" + " fmt";
          };
        } // formatters;
      };
    };
  };
}
