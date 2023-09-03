{ pkgs, lib, config, ... }: {
  imports = [
    ./desktop.nix
    ./mpd.nix
    ./services.nix
    ./xdg.nix
    ./xresources.nix
  ];

  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };
}