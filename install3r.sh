#!/bin/bash
echo ""
echo "Please start this script with an user, not with root! For creating an user you can see the README file on my github repo!"
echo ""
echo "Welcome, this is a complete i3 wm installer for ArchLinux! See my github profile: https://github.com/FrancescoXD"
#Starting
echo ""
echo "Do you want also a display manager? In this script will be installed lightdm (yes/no)"

#Select lightdm
read installLightdm

#Start downloading
if [ $installLightdm ]; then
	echo "Lightdm selected!"
	echo "This script addons are: rofi, termite, feh, compton and the font-awesome."
	echo "Start downloading packages..."
	sudo pacman -Syu
	sudo pacman -S xorg i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome lightdm lightdm-gtk-greeter
	#Enable lightdm with systemd
	systemctl enable lightdm
else
	echo "Installing only i3 without Lightdm..."
	echo "This script addons are: rofi, termite, feh, compton and the font-awesome."
	sudo pacman -Syu
	sudo pacman -S xorg i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome
	#Enable lightdm with systemd
	systemctl enable lightdm
fi

#Config files on $HOME/.config/
echo "i3 was successful installed, now do you want default config on ~/.config/? (yes/no)"
read selectConfig

if [ $selectConfig ]; then
	echo "Creating ~/.config/ dir..."
	echo "Creating termite, rofi, compton, i3blocks folders..."
	mkdir ~/.config/ ~/.config/termite ~/.config/compton ~/.config/i3 ~/.config/i3blocks
else
	echo "Thanks for using this script."
fi

#Finally
echo "Finally, you have to reboot."
