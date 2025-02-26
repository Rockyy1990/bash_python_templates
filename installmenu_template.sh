#!/usr/bin/env bash

# Install menu template.
# This script shows a menu to install various programs. 
# Option for exit is included.

# Last Edit: 26.02.2025

# Function to display the menu
display_menu() {
    echo "=============================="
    echo "       Installation Menu      "
    echo "=============================="
    echo "1. Install Git"
    echo "2. Install Node.js"
    echo "3. Install Docker"
    echo "4. Install Python"
    echo "5. Exit"
    echo "=============================="
}

# Function to install Git
install_git() {
    echo "Installing Git..."
    sudo apt update
    sudo apt install -y git
    echo "Git installation completed."
}

# Function to install Node.js
install_node() {
    echo "Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    echo "Node.js installation completed."
}

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    echo "Docker installation completed."
}

# Function to install Python
install_python() {
    echo "Installing Python..."
    sudo apt update
    sudo apt install -y python3 python3-pip
    echo "Python installation completed."
}

# Main script execution
while true; do
    display_menu
    read -p "Please select an option (1-5): " choice

    case $choice in
        1)
            install_git
            ;;
        2)
            install_node
            ;;
        3)
            install_docker
            ;;
        4)
            install_python
            ;;
        5)
            echo "Exiting the installation script."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    echo ""
done