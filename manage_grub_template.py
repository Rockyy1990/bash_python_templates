#/usr/bin/env python3

import os
import subprocess
import shutil
from datetime import datetime

def add_kernel_parameter(parameter):
    grub_cfg_path = "/etc/default/grub"
    try:
        with open(grub_cfg_path, 'r') as file:
            lines = file.readlines()

        for i, line in enumerate(lines):
            if line.startswith("GRUB_CMDLINE_LINUX_DEFAULT"):
                # Modify the line to add the new parameter
                lines[i] = line.strip() + f" {parameter}\""
                break

        with open(grub_cfg_path, 'w') as file:
            file.writelines(lines)

        print(f"Added kernel parameter: {parameter}")
    except Exception as e:
        print(f"Error adding kernel parameter: {e}")

def edit_grub_cfg():
    grub_cfg_path = "/etc/default/grub"
    try:
        subprocess.run(['nano', grub_cfg_path])
    except Exception as e:
        print(f"Error opening GRUB configuration in nano: {e}")

def backup_grub():
    grub_cfg_path = "/etc/default/grub"
    backup_path = f"{grub_cfg_path}.{datetime.now().strftime('%Y%m%d%H%M%S')}.bak"
    try:
        shutil.copy(grub_cfg_path, backup_path)
        print(f"Backup of GRUB configuration created at: {backup_path}")
    except Exception as e:
        print(f"Error creating backup: {e}")

def update_grub():
    backup_grub()  # Backup GRUB before updating
    try:
        subprocess.run(['update-grub'], check=True)
        print("GRUB updated successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error updating GRUB: {e}")

def main():
    while True:
        print("\nGRUB Bootloader Management")
        print("1. Add Kernel Boot Parameter")
        print("2. Edit GRUB Configuration with Nano")
        print("3. Update GRUB (Backup will be created)")
        print("4. Exit")

        choice = input("Select an option (1-4): ")

        if choice == '1':
            parameter = input("Enter the kernel boot parameter to add: ")
            add_kernel_parameter(parameter)
        elif choice == '2':
            edit_grub_cfg()
        elif choice == '3':
            update_grub()
        elif choice == '4':
            print("Exiting...")
            break
        else:
            print("Invalid option. Please try again.")

if __name__ == "__main__":
    main()