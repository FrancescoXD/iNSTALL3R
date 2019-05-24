# iNSTALL3R
An usefull i3wm automatic installer for ArchLinux.

## Requirements
First of all you need to create an user:
```
useradd -m -G wheel -s /bin/bash USER
passwd USER
```
After you need to modify the ```visudo``` uncommenting ```%wheel```. Now you have to **logout** and enter with the new **user**.

# How to install
In a fresh install of ArchLinux you need to download **git** with ```sudo pacman -S git```.
Now **clone** the repo with: 
```
git clone https://github.com/FrancescoXD/iNSTALL3R.git
cd iNSTALL3R
chmod 777 install3r.sh
./install3r.sh
```
