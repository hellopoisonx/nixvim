{
  plugins.nvim-tree = {
    enable = false;
    autoReloadOnWrite = true;
    autoClose = true;
    syncRootWithCwd = false;
    hijackNetrw = true;
    onAttach = {
      __raw = ''
        function(bufnr)
          local api = require "nvim-tree.api"

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set('n', '<<', api.tree.change_root_to_parent,        opts('Up'))
          vim.keymap.set('n', '>>', api.tree.change_root_to_node,        opts('Cd'))
          vim.keymap.set('n', 'fc',       api.live_filter.clear,               opts('Live Filter: Clear'))
          vim.keymap.set('n', 'fs',       api.live_filter.start,               opts('Live Filter: Start'))
          vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
        end
      '';
    };
  };
  # plugins.web-devicons.enable = true; # dep
  # keymaps = [
  #   {
  #     action = "<cmd>NvimTreeToggle<cr>";
  #     mode = [ "n" ];
  #     key = "<leader>fe";
  #   }
  # ];
}
