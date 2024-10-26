{ lib, config, ... }:
let
  servers = config.nixvim-conf.servers;
in
{
  options.nixvim-conf.servers = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
  };
  config = {
    plugins.lsp-format = {
      enable = false; # use conform instead
      lspServersToEnable = "all";
    };
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "]g" = "goto_next";
          "[g" = "goto_prev";
        };
        lspBuf = {
          # K = "hover";
          # gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = lib.mergeAttrs {
        nixd.enable = true;
        lua_ls.enable = true;
        bashls.enable = true;
        bashls.filetypes = [
          "bash"
          "sh"
          "zsh"
        ];
      } servers;
    };
  };
}
