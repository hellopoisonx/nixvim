{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        zsh = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        lua = [ "stylua" ];
        cpp = [ "clang_format" ];
        c = [ "clang_format" ];
        nix = [ "nixfmt" ];
        elixir = [ "mix" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      # format_on_save = # Lua
      #     ''
      #     function(bufnr)
      #       if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      #         return
      #       end
      #
      #       if slow_format_filetypes[vim.bo[bufnr].filetype] then
      #         return
      #       end
      #
      #       local function on_format(err)
      #         if err and err:match("timeout$") then
      #           slow_format_filetypes[vim.bo[bufnr].filetype] = true
      #         end
      #       end
      #
      #       return { timeout_ms = 200, lsp_fallback = true }, on_format
      #      end
      #   '';
      # format_after_save = # Lua
      #   ''
      #     function(bufnr)
      #       if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      #         return
      #       end
      #
      #       if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      #         return
      #       end
      #
      #       return { lsp_fallback = true }
      #     end
      #   '';
      log_level = "warn";
      notify_on_error = true;
      notify_no_formatters = true;
      formatters = {
        shellcheck = {
          command = lib.getExe pkgs.shellcheck;
        };
        shfmt = {
          command = lib.getExe pkgs.shfmt;
        };
        shellharden = {
          command = lib.getExe pkgs.shellharden;
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        nixfmt = {
          command = lib.getExe' pkgs.nixfmt-rfc-style "nixfmt";
        };
        clang_format = {
          command = lib.getExe' pkgs.libclang "clang-format";
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };

    };
  };
}
