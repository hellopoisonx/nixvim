{
  pkgs,
  base,
  lib,
  ...
}:
base.extend {
  plugins.lsp.servers = {
    clangd.enable = true;
    cmake.enable = true;
  };
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    make
    cmake
    c
    cpp
  ];
  plugins.conform-nvim.settings = {
    formatters_by_ft = {
      c = [ "clang-format" ];
      cpp = [ "clang-format" ];
      hpp = [ "clang-format" ];
      h = [ "clang-format" ];
      cmake = [ "cmake_format" ];
    };
    formatters = {
      clang-format.command = lib.getExe' pkgs.clang-tools "clang-format";
      cmake_format.command = lib.getExe' pkgs.cmake-format "cmake-format";
    };
  };
}
