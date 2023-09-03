{ config, pkgs, ... }: {
  home.file = {
    ".config/cat-configs" = {
      source = ./cat-configs;
      recursive = true;
    };

    ".config/cat-configs/bin/utilities/terminal.sh" = {
      source = import ./bin/utilities/terminal.nix { inherit pkgs; };
      executable = true;
    };
  };
}