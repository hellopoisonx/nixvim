{
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
    servers =
      {
      };
  };
}
