#!/bin/bash

# Installer Version: 1.9.2
# A fork of https://github.com/manas140/dotfiles install.sh

# Use the comments to navigate

# Colors
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

clear # To remove some text from above to make it easier to read

# Logo
printf "${cb}  ____    _  _____     ____   ___ _____ ____\n"
printf "${cg} / ___|  / \|_   _|   |  _ \ / _ \_   _/ ___|\n"
printf "${cr}| |     / _ \ | |_____| | | | | | || | \___ |\n"
printf "${cg}| |___ / ___ \| |_____| |_| | |_| || |  __) |\n"
printf "${cb} \____/_/   \_\_|     |____/ \___/ |_| |____/\n"
printf "${cr}     The Dotfiles with catppuccin colors\n"

# Spaces
echo
echo

# Alpha
printf "${cb}[*] Alpha Test (Note: This is just a alpha test to see if the installer doesn't error out)\n"

# Warning
printf "${cg}[*] PROCEDING WILL MAKE A BACKUP FOR ALL YOUR CONFIGS IN ($HOME/.config/backups)\n" && sleep 1
printf "${cg}[*] Warning: Installer will replace the old backups with the current one is installed if the installer runs the second times.\n"  && sleep 1
printf "${cg}[*] Please rename the backups folder or just move it to another location\n" && sleep 2
printf "${cr}"
read -p "[-] DO YOU WANT TO PROCEED [Y/N] : " install

# Directory
dir="$HOME/.config $HOME/.dotfiles $HOME/Pictures/Wallpapers $HOME/.local/bin $HOME/.fonts $HOME/.config/backups"

# Abort
case $install in
    N*|n*)
    clear
    printf "${cr}[-] Aborting!\n"
esac

# Install
case $install in
    Y*|y*)
    for a in $dir; do 
        mkdir -p $a # Makes the directories
    done
esac

clear
# Packages (Arch Only)
printf "${cr}"
read -p "[-] ARE YOU USING ARCHLINUX [Y/N] : " arch

case $arch in
    Y*|y*)
    # Package (Arch Linux)
    clear
    printf "${cg}[*] Updating System\n" && sleep 2
    sudo pacman --noconfirm -Syu

    printf "${cb}[*] Installing Dependencies\n" && sleep 2
    sudo pacman -S --noconfirm --needed git xorg curl

    # AUR
    printf "${cr}[*] Select a AUR helper (Required)\n"
    printf "${cr}"
    read -p "[-] (P)paru | (Y)yay : " helper

    # Paru
        case $helper in
            P*|p*)
            cd $HOME/.dotfiles
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            paru -S --needed bspwm sxhkd polybar rofi zsh kitty picom-ibhagwan-git dunst gtk3 gtk-engine-murrine gnome-themes-extra pulseaudio pulseaudio-alsa pulseaudio-bluetooth alsa alsa-utils feh volumectl brightnessctl i3lock-color ksuperkey sddm rofi-bluetooth-git yad networkmanager-dmenu-git cava nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-iosevka ttf-iosevka-nerd
        esac
    # Yay
        case $helper in
            Y*|y*) 
            cd $HOME/.dotfiles
            git clone https://aur.archlinux.org/yay.git
            cd yay
            makepkg -si
            yay -S --needed bspwm sxhkd polybar rofi zsh kitty picom-ibhagwan-git dunst gtk3 gtk-engine-murrine gnome-themes-extra pulseaudio pulseaudio-alsa pulseaudio-bluetooth alsa alsa-utils feh volumectl brightnessctl i3lock-color ksuperkey sddm rofi-bluetooth-git yad networkmanager-dmenu-git cava nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-iosevka ttf-iosevka-nerd
esac
# Installing Oh my zsh
    printf "${cb}[*] Installing OMZ\n" && sleep 2
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Copying Files
    clear
    printf "${cb}[*] Getting dotfiles\n" && sleep 2
    cd $HOME/.dotfiles
    git clone https://github.com/Deathemonic/Cat-Dots.git
    cd ./Cat-Dots
    printf "${cr}[*] Making backups\n" && sleep 5
    mv $HOME/.config/bspwm/ $HOME/.config/backups
    mv $HOME/.config/sxhkd/ $HOME/.config/backups
    mv $HOME/.config/polybar/ $HOME/.config/backups
    mv $HOME/.config/networkmanager-dmenu/ $HOME/.config/backups
    mv $HOME/.config/eww/ $HOME/.config/backups
    mv $HOME/.config/nvim $HOME/.config/backups
    mv $HOME/.config/kitty/ $HOME/.config/backups
    mv $HOME/.config/dunst/ $HOME/.config/backups
    mv $HOME/.config/zathura/ $HOME/.config/backups
    mv $HOME/.config/cava $HOME/.config/backups
    mv $HOME/.config/picom.conf $HOME/.config/backups
    mv $HOME/.Xresources $HOME/.config/backups
    mv $HOME/.zshrc $HOME/.config/backups
    mv $HOME/.ncmpcpp/* $HOME/.config/backups
    mv $HOME/.mpd/* $HOME/.config/backups
    mv $HOME/.vimrc $HOME/.config/backups
    mv $HOME/.startpage/ $HOME/.config/backups
    cp -ra $HOME/.local/bin/* $HOME/.configs/backups
    printf "${cr}[*] Deleting old configs\n" && sleep 2
    printf "${cg}[*] Copying dotfiles\n" && sleep 3
    printf "${cb}[*] Copying configs\n" && sleep 4
    cp -ra ./config/* $HOME/.config
    cp -ra ./home/* $HOME/.
    printf "${cg}[*] Configs copied\n" && sleep 2
    printf "${cb}[*] Copying scripts\n" && sleep 3
    cp -ra ./bin/* $HOME/.local/bin/
    printf "${cg}[*] Scripts copied\n" && sleep 2
    printf "${cr}[*] Making them excutables\n" && sleep 2
    chmod +x ~/.local/bin/*
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/rofi/bin/*
    chmod +x ~/.config/polybar/launch.sh
    printf "${cb}[*] Copying wallpapers\n" && sleep 3
    cp -ra ./walls/* $HOME/Pictures/Wallpapers
    printf "${cg}[*] Wallpapers copied\n" && sleep 2
    printf "${cb}[*] Copying fonts\n" && sleep 3
    cp -ra ./fonts/* $HOME/.fonts
    fc-cache -fv
    printf "${cg}[*] Fonts copied\n" && sleep 2
    printf "${cg}[*] Dotfiles installed\n" && sleep 2
# Finishing    
    printf "${cb}[-] Done\n" && sleep 3
    clear
    printf "${cr}[*] Please Reboot your system!!\n"
    echo " "
    printf "${cb}[|] If the installer has problem installing or missing feature please summit a pull requise or issue on the Github Page\n" # This is a message
    printf "${cb}[|] For extra information like spotify setup or firefox setup please go to this Cat-Dot's Github Wiki Page\n"
    printf "${cb}[|] Please go to the Cat-Dot's Github Wiki Page for Manual Installation and fixes\n"
    echo " "
    printf "${cr}[-] Exiting!\n"
esac
