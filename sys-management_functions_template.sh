#!/usr/bin/env bash

# System management bash script template with useful functions.

# Last Edit: 26.02.2025

# Script Name: system_management.sh
# Description: A script to manage system configurations and install packages.

# Function to update the package list
update_packages() {
    echo "Updating package list..."
    sudo apt update
}

# Function to upgrade installed packages
upgrade_packages() {
    echo "Upgrading installed packages..."
    sudo apt upgrade -y
}

# Function to install a package
install_package() {
    PACKAGE_NAME=$1
    echo "Installing package: $PACKAGE_NAME..."
    sudo apt install -y "$PACKAGE_NAME"
}

# Function to remove a package
remove_package() {
    PACKAGE_NAME=$1
    echo "Removing package: $PACKAGE_NAME..."
    sudo apt remove -y "$PACKAGE_NAME"
}

# Function to set a configuration (example: change hostname)
set_hostname() {
    NEW_HOSTNAME=$1
    echo "Setting hostname to: $NEW_HOSTNAME..."
    sudo hostnamectl set-hostname "$NEW_HOSTNAME"
}

# Function to create a backup of a configuration file
backup_config() {
    CONFIG_FILE=$1
    BACKUP_FILE="${CONFIG_FILE}.bak"
    echo "Backing up $CONFIG_FILE to $BACKUP_FILE..."
    sudo cp "$CONFIG_FILE" "$BACKUP_FILE"
}

# Function to display system information
display_system_info() {
    echo "System Information:"
    uname -a
    echo "Disk Usage:"
    df -h
    echo "Memory Usage:"
    free -h
}

# Function to check the status of a service
check_service_status() {
    SERVICE_NAME=$1
    echo "Checking status of service: $SERVICE_NAME..."
    systemctl status "$SERVICE_NAME"
}

# Main script execution
main() {
    update_packages
    upgrade_packages

    # Example usage of functions
    install_package "curl"
    install_package "git"
    remove_package "nano"

    set_hostname "my-new-hostname"
    backup_config "/etc/hosts"

    display_system_info
    check_service_status "ssh"
}

# Execute the main function
main