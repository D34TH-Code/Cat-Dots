{ config, pkgs, ... }: {
  xsession = {
    windowManager = {
      bspwm = {
        enable = true;
        package =  pkgs.bspwm;

        extraConfig = ''
          name=1
          for monitor in $(bspc query -M); do
	          bspc monitor "$monitor" -n "$name" -d '1' '2' '3' '4' '5' '6' '7' '8'
	          name=$((name + 1))
          done
        ''

        settings = {
          border_width = 0;
          window_gap = 10;
          split_ratio = 0.50;
          bottom_padding = 0;

          borderless_monocle = true;
          gapless_monocle = false;
          focus_follows_pointer = true;
          paddingless_monocle = true;
          single_monocle = false;
          presel_feedback = true;
        };

        rules = {
          "alacritty_float" = {
            state = "floating";
            follow = true;
          };

          "alacritty_fullscreen" = {
            state = "fullscreen";
            follow = true;
          };

          "Onboard" = {
            state = "floating";
          };

          "Viewnior" = {
            state = "floating";
          };

          "feh" = {
            state = "floating";
          };

          "Nm-connection-editor" = {
            state = "floating";
          };

          "stalonetray" = {
            state = "floating";
            manage = false;
          };

          "Lxappearance" = {
            state = "floating";
          };

          "Yad" = {
            state = "floating";
          };
        };
      };
    };
  };
}