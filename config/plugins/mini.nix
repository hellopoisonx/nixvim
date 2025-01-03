{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      comment = {
        mappings = {
          comment = "gc";
          comment_line = "gcc";
          comment_visual = "gc";
          textobject = "gc";
        };
      };
      icons = {
        style = "glyph";
      };
      statusline = { };
      indentscope = { };
      tabline = { };
      ai = { };
      pairs = {
        modes = {
          insert = true;
          command = true;
          terminal = true;
        };
      };
      files = { };
      extra = { };
      pick = { };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };
}
