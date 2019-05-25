#!/bin/bash
printf "
  _ _   _ ____ _____  _    _     _     _____ ____  
 (_) \ | / ___|_   _|/ \  | |   | |   |___ /|  _ \ 
 | |  \| \___ \ | | / _ \ | |   | |     |_ \| |_) |
 | | |\  |___) || |/ ___ \| |___| |___ ___) |  _ < 
 |_|_| \_|____/ |_/_/   \_\_____|_____|____/|_| \_\
                                                   
"
echo ""
echo "Welcome, this is a complete i3 wm installer for ArchLinux! See my github profile: https://github.com/FrancescoXD"
#Starting
echo ""
#If the user who is executing the script is root
if [ $EUID == 0 ]; then
	echo "You are executing this script with root user, do you need to create an user? (yes/no)"
	read createUser
	if [ $createUser ==  yes ]; then
		echo "Insert the name of the user to create:"
		read $userToCreate
		#Create User
		useradd -m -G wheel -s /bin/bash $userToCreate
		#Modify the visudo
		sed -i -e 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
	else
		echo "If you don't need to create an user, login with a non-root user!"
	fi
fi

if [ $EUID != 0 ]; then
	echo ""
	echo "Do you want also a display manager? In this script lightdm will be installed (yes/no)"

	#Select lightdm
	read installLightdm

	#Start downloading
	if [ $installLightdm == yes ]; then
		echo "Lightdm selected!"
		echo "This script addons are: rofi, termite, feh, compton and font-awesome."
		echo "Start downloading packages..."
		sudo pacman -Syu
		sudo pacman -S xorg i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome lightdm lightdm-gtk-greeter
		#Enable lightdm with systemd
		sudo systemctl enable lightdm
	else
		echo "Installing only i3 without Lightdm..."
		echo "This script addons are: rofi, termite, feh, compton and font-awesome."
		sudo pacman -Syu
		sudo pacman -S xorg i3 i3-gaps i3status i3blocks rofi termite feh compton otf-font-awesome ttf-font-awesome
		#Enable lightdm with systemd
		sudo systemctl enable lightdm
	fi

	#Config files on ~/.config/
	echo ""
	echo "####################"
	echo ""
	echo "i3 was successful installed, now do you want default config on ~/.config/? (yes/no)"
	read selectConfig

	if [ $selectConfig == yes]; then
		echo "Creating ~/.config/ dir..."
		echo "Creating termite, rofi, compton, i3blocks folders..."
		mkdir ~/.config/ ~/.config/termite ~/.config/compton ~/.config/i3 ~/.config/i3blocks
		#Copy compton config to $HOME/.config/compton
		cp /etc/xdg/compton.conf ~/.config/compton/
		#Copy termite config to ~/.config/termite
		cp /etc/xdg/termite/config ~/.config/termite/config
		#Copy i3blocks config to ~/.config/i3blocks
		cp /etc/i3blocks.conf ~/.config/i3blocks/
	else
		echo "Thanks for using this script."
	fi

	#Finally
	echo "Finally, you have to reboot."
fi
