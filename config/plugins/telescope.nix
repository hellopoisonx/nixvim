{
  plugins.telescope = {
    enable = false;
    # keymaps = {
    #   "<leader>fg" = {
    #     action = "live_grep";
    #     options = {
    #       desc = "Telescope Live Grep";
    #     };
    #   };
    #   "<leader>fs" = {
    #     action = "grep_string";
    #     options = {
    #       desc = "Telescope Grep String";
    #     };
    #   };
    #   "<leader>ff" = {
    #     action = "find_files";
    #     options = {
    #       desc = "Telescope Find Files(neglect .gitignore)";
    #     };
    #   };
    #   "<leader>fb" = {
    #     action = "buffers";
    #     options = {
    #       desc = "Telescope Pick Buffer";
    #     };
    #   };
    #   "<leader>fu" = {
    #     action = "undo";
    #     options = {
    #       desc = "Telescope Undo History";
    #     };
    #   };
    # };
    extensions.fzf-native = {
      enable = true;
    };
    extensions.undo = {
      enable = true;
    };
  };
}
