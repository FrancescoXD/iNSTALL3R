#!/bin/bash
echo "Welcome, this is a complete i3 wm installer for ArchLinux! See my github profile: https://github.com/FrancescoXD"
#Please read this first!
echo "Before using this script you have to create a new user (Example: useradd -m -G wheel -s /bin/bash USER), now you have to uncomment %wheel on the visudo file"
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
	sudo pacman -S i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome lightdm lightdm-gtk-greeter
else
	echo "Installing only i3 without Lightdm..."
	echo "This script addons are: rofi, termite, feh, compton and the font-awesome."
	sudo pacman -Syu
	sudo pacman -S i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome
fi

#Config files on $HOME/.config/
echo "i3 was successful installed, now do you want default config on $HOME/.config/? (yes/no)"
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
