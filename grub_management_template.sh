#!/bin/bash

# Script to manage GRUB bootloader
# Author: Your Name
# Date: YYYY-MM-DD

GRUB_CFG="/etc/default/grub"
GRUB_BACKUP="/etc/default/grub.bak"

function backup_grub_cfg {
    echo "Backing up GRUB configuration..."
    if cp "$GRUB_CFG" "$GRUB_BACKUP"; then
        echo "Backup successful: $GRUB_BACKUP"
    else
        echo "Backup failed!"
        exit 1
    fi
}

function add_boot_option {
    echo "Adding boot option..."
    read -p "Enter the new boot option (e.g., 'GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"'): " new_option

    # Check if the new option is already present
    if grep -q "$new_option" "$GRUB_CFG"; then
        echo "Boot option already exists in $GRUB_CFG."
    else
        # Append the new option to the GRUB configuration
        sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/\"/ \"$new_option /" "$GRUB_CFG"
        echo "Boot option added: $new_option"
    fi
}

function update_grub {
    echo "Updating GRUB..."
    if grub-mkconfig -o /boot/grub/grub.cfg; then
        echo "GRUB updated successfully."
    else
        echo "Failed to update GRUB."
        exit 1
    fi
}

function show_menu {
    echo "GRUB Bootloader Management"
    echo "1. Backup GRUB configuration"
    echo "2. Add boot option"
    echo "3. Update GRUB"
    echo "4. Exit"
}

while true; do
    show_menu
    read -p "Select an option [1-4]: " option

    case $option in
        1)
            backup_grub_cfg
            ;;
        2)
            add_boot_option
            ;;
        3)
            update_grub
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done