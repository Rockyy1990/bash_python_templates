#/usr/bin/env bash

# Last Edit: 26.02.2025

# A basic bash install script template.
# Feel free to custimize it.

# Funktion zur Überprüfung, ob das Skript mit sudo ausgeführt wird.
check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "This script must be run as root. Attempting to re-run with sudo..."
        exec sudo "$0" "$@"
        exit 1
    fi
}

# Call the function to check for sudo
check_sudo

# Your script logic goes here
echo "Running with root privileges!"
# Add your commands below


echo "--------------------"
echo " This is a template "
echo "--------------------"

read -p " .. "

# Package manager . Dont forget to remove the <>
sudo <packagemanager> install <package>

# Add lines into a file e.g. /etc/environment 
echo ".." | sudo tee -a /path/to/file


clear
read -p " Complete. Press any key to reboot"
sudo reboot