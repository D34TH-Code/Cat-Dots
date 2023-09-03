{ lib, pkgs, config, inputs, outputs, ... }: {
  imports = [
    ./shared
    ./packages
    ./configs
  ] ++ ( builtins.attrValues outputs.homemanagerModules );

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  nix = {
    package = lib.mkForce pkgs.nixUnstable;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.default
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = outputs.user;
    homeDirectory = "/home/${config.home.username}";
    # Do not change
    # Read this https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion 
    stateVersion = "23.11";
  };
}