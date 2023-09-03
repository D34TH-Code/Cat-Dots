{
  services = {
    playerctld.enable = true;

    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
      enableSshSupport = true;
      enableZshIntegration = true;
    };

    sxhkd = {
      enable = true;

      keybindings = {
        "super + Return" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/terminal.sh";
        "super + shift {t,w}" =  "{vscodium,firefox}";
        "super + e" = "nautilus";
        "super + alt + {v,e,h}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/terminal.sh -e {nvim,ranger,htop}";
        "super + {a,r,w}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/menu/launcher.sh {drun,run,window}";
        "super + p" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/menu/power.sh";
        "super + shift + f" =  "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/menu/launcher.sh filebrowser";
        "super + shift + n" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/menu/network.py";
        "super + shift + p" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/menu/pallete.sh";
        "super + shift + {s,r}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/{screenshot.sh,screenrecord.sh} --menu";
        "super + g" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/color-picker.sh";
        "super + shift + alt + L" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/lockscreen.sh";
        "Print" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenshot.sh --shot";
        "super + alt + {w,a}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenshot.sh {--window,--area}";
        "super + ctrl + t" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenshot.sh --timer";
        "super + alt + {r,s}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenrecord.sh {--capture,--stop}";
        "super + alt + shift + {r,a,t}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenrecord.sh {--capture --noaudio,--area --noaudio,--timer --noaudio}";
        "super + alt + ctrl + a" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenrecord.sh --area";
        "super + alt + ctrl + t" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenrecord.sh --timer";
        "XF86MonBrightness{Up,Down}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/brightness.sh {--up,--down}";
        "XF86Audio{RaiseVolume,LowerVolume,Mute}" = "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/volume.sh {--up,--down,--mute}";
        "XF86Audio{Next,Prev,Play}" = "playerctl -p spotify,%any,firefox,chromium,brave,mpd {next,previous,play-pause}";
        "XF86AudioStop" = "playerctl -a stop";
        "super + {_,shift + }x" = "bspc node -{c,k}";
        "super + Escape" = "pkill -USR1 -x sxhkd";
        "ctrl + alt + Escape" = "xkill";
        "ctrl + shift + {q,r}" = "bspc {quit,wm -r}";
        "super + {h,v,q}" = "bspc node -p {east,south,cancel}";
        "F11" = "bspc node -t '~'fullscreen";
        "super + space" = "bspc node -t '~'{floating,tiled}";
        "super + alt + {p,t}" = "bspc node -t '~'{pseudo_tiled,tiled}";
        "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
        "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
        "alt + {_,shift + }Tab" = "bspc node -f {next.local,prev.local}";
        "ctrl + alt + {Left,Right}" = "bspc desktop -f {prev.local,next.local}";
        "super + {Tab,grave}" = "bspc {node,desktop} -f last";
        "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'";
        "super + control + {Left,Right,Up,Down}" = "bspc node -z {left -20 0,right 20 0,top 0 -20,bottom 0 20}";
        "super + alt + {Left,Right,Up,Down}" = "bspc node -z {left 20 0,right -20 0,top 0 20,bottom 0 -20}";
        "alt + shift + {Left,Down,Up,Right}" = "bspc node -v {20 0,0 20,0 -20,-20 0}";
        "super + shift + i" = "winmask";
        "super + ctrl + alt +{Left,Right,Up,Down}" = "bspc node -p {west,east,north,south}";
        "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
        "super + ctrl + space" = "bspc node -p cancel";
        "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";
      };
    };
  };
}