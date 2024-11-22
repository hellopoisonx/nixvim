{
  plugins.toggleterm = {
    enable = true;
    settings = {
      hide_numbers = true;
      autochdir = false;
      shade_terminals = true;
      start_in_insert = true;
      insert_mappings = true;
      terminal_mappings = true;
      persist_size = true;
      persist_mode = true;
      direction = "float";
      close_on_exit = true;
      clear_env = true;
      auto_scroll = true;
      float_opts = {
        border = "curved";
        winblend = 3;
        title_pos = "center";
      };
      winbar = {
        enabled = true;
      };
    };
  };
}
