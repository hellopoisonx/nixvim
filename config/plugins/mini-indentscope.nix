pkgs: {
  p = with pkgs; [ vimPlugins.mini-indentscope ];
  config = ''
    require('mini.indentscope').setup()
  '';
}
