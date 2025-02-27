#!/bin/bash

# openSUSE Tumbleweed System Management Script
# Author: Your Name
# Date: YYYY-MM-DD
# Description: A script to manage an openSUSE Tumbleweed system.

# Function to update the system
update_system() {
    echo "Updating the system..."
    sudo zypper refresh
    sudo zypper update -y
    echo "System updated successfully."
}

# Function to check disk usage
check_disk_usage() {
    echo "Checking disk usage..."
    df -h
}

# Function to manage services
manage_service() {
    echo "Managing services..."
    echo "Available options:"
    echo "1) Start a service"
    echo "2) Stop a service"
    echo "3) Restart a service"
    echo "4) Status of a service"
    read -p "Choose an option (1-4): " option
    read -p "Enter the service name: " service_name

    case $option in
        1)
            sudo systemctl start "$service_name"
            echo "Service $service_name started."
            ;;
        2)
            sudo systemctl stop "$service_name"
            echo "Service $service_name stopped."
            ;;
        3)
            sudo systemctl restart "$service_name"
            echo "Service $service_name restarted."
            ;;
        4)
            sudo systemctl status "$service_name"
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}

# Function to display system information
system_info() {
    echo "System Information:"
    uname -a
    echo "Kernel version: $(uname -r)"
    echo "Uptime: $(uptime -p)"
}

# Main menu
main_menu() {
    while true; do
        echo "=============================="
        echo " openSUSE Tumbleweed Management"
        echo "=============================="
        echo "1) Update System"
        echo "2) Check Disk Usage"
        echo "3) Manage Services"
        echo "4) System Information"
        echo "5) Exit"
        read -p "Choose an option (1-5): " choice

        case $choice in
            1)
                update_system
                ;;
            2)
                check_disk_usage
                ;;
            3)
                manage_service
                ;;
            4)
                system_info
                ;;
            5)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
        echo ""
    done
}

# Run the main menu
main_menu