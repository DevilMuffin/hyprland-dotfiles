#!/bin/bash

PACMANPKGS=("hyprland" "waybar" "hyprlock" "kitty" "swaync" "thunar" "bottom" "nwg-look" "python" "pywal" "rofi" "nvim" "zsh" "swww")
YAYPKGS=("cava" "wlogout")

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Update package database and upgrade system
echo "Updating package database and upgrading system..."
pacman -Syu --noconfirm

#Installing yay if not already installed
if command -v yay > /dev/null 2>&1; then
    echo "yay is installed on the system."
else
    echo "yay is not installed on the system."
    echo "Installing yay now..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi


#Installing the packages
echo "Installing pacman packages"
sudo pacman --noconfirm -S "${PACMANPKGS[@]}" 2> /dev/null |\
awk '{if ($1 ~ /installing/) {print "installing: " $2} else if ($1 ~ /upgrading/) {print "upgrading: " $2}}'

if [ $? -eq 0 ]; then
    echo "All pacman packages processed successfully."
else
    echo "An error occurred during pacman packages installation." >&2
fi

echo "Installing yay packages (This may take a bit)"
yay -S --noconfirm "${YAYPKGS[@]}" 2>&1 | \
awk '{if ($1 ~ /:: Installing/) {print "installing: " $NF} else if ($1 ~ /:: Upgrading/) {print "upgrading: " $NF}}'

if [ $? -eq 0 ]; then
    echo "All yay packages processed successfully."
else
    echo "An error occurred during yay packages installation." >&2
fi

#oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing NvChad..."
git clone https://github.com/NvChad/NvChad ~/.config/nvim
echo "Running Neovim to install plugins"
nvim +PackerInstall +qall
echo "NVChad installation completed!"


#Configs !!! 
#(Later me issue)



exit 0