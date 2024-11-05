{ lib, config, ... }:
let
  servers = config.lspServers;
in
{
  options.lspServers = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config = {
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
      servers = {
        nixd.enable = true;
        lua_ls.enable = true;
        bashls.enable = true;
        elixirls.enable = true;
        html.enable = true;
        cssls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        cmake.enable = true;
        bashls.filetypes = [
          "bash"
          "sh"
          "zsh"
        ];
      } // servers;
    };
  };
}
