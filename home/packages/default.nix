{ pkgs, config, ... }: let
  core = import ./core.nix { pkgs = pkgs; };
in {
  imports = [ ./programs.nix ];
  home.packages = with pkgs; [ ]
  ++ core;
}