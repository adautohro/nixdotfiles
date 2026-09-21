{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  packages = with pkgs; [
    nixfmt
  ];

  # https://devenv.sh/packages/
  # https://devenv.sh/languages/
  languages.nix.enable = true;

  # https://devenv.sh/services/
  # services.postgres.enable = true;
}
