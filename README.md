# Nixvim configuration
## Use

In your flake.nix:

```nix
inputs.nixvim.url = "github:hellopoisonx/nixvim";
```

## Extending

```nix
inputs.nixvim.packages.${system}.default.extend {
  # e.g
  plugins.bufferline.enable = false;
}
```
