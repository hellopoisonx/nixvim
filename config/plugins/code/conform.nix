{
  config,
  lib,
  pkgs,
  ...
}:
let
  formatters_by_ft = config.formatters_by_ft;
  formatters = config.formatters;

in
{
  options = {
    formatters_by_ft = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
    formatters = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
  config = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = lib.mergeAttrs {
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
          nix = [ "nixfmt" ];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        } formatters_by_ft;
        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;
        formatters = lib.mergeAttrs {
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
        } formatters;

      };
    };
  };
}
