pkgs:
let
  plugins = [
    (import ./mini-indentscope.nix pkgs)
    # (import ./code/elixir-tools.nix pkgs)
  ];
in
(builtins.foldl' (a: b: {
  p = a.p ++ b.p;
  config = "${a.config}\n${b.config}";
}) (builtins.head plugins) plugins)
