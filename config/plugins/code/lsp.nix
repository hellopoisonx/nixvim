{
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
    servers = {
      nixd.enable = true;
      lua_ls.enable = true;
      bashls.enable = true;
      elixirls.enable = true;
      bashls.filetypes = [
        "bash"
        "sh"
        "zsh"
      ];
    };
  };
}
