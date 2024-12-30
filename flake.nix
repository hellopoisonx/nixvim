{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config; # import the module directly
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
          base = nvim.extend {
            plugins.lsp.servers = {
              nixd.enable = true;
              lua_ls.enable = true;
              bashls.enable = true;
              bashls.filetypes = [
                "bash"
                "sh"
                "zsh"
              ];
            };
            plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
              json
              xml
              yaml
              toml
              regex
              markdown
              bash
              lua
            ];
            plugins.conform-nvim.settings = {
              formatters_by_ft = {
                sh = [
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
                "nix" = [ "nixfmt" ];
                "_" = [
                  "squeeze_blanks"
                  "trim_whitespace"
                  "trim_newlines"
                ];
              };
            };
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            default = base;
            c-cpp = (
              import ./variants/c-cpp.nix {
                inherit pkgs;
                inherit base;
              }
            );
          };
        };
    };
}
