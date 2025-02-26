#!/usr/bin/env python

import subprocess
import os
import sys

def install_package(package_name):
    """Install a package using zypper."""
    try:
        subprocess.run(['sudo', 'zypper','-n','install' package_name], check=True)
        print(f"{package_name} installed successfully.")
    except subprocess.CalledProcessError:
        print(f"Failed to install {package_name}.")

def main():
    while True:
        print("\nSelect a program to install:")
        print("1. Firefox")
        print("2. Steam")
        print("3. Celluloid")
        print("4. Exit")

        choice = input("Enter your choice (1-4): ")

        if choice == '1':
            install_package('MozillaFirefox')
        elif choice == '2':
            install_package('steam')
        elif choice == '3':
            install_package('celluloid')
        elif choice == '4':
            print("Exiting the installer.")
            break
        else:
            print("Invalid choice. Please select a valid option.")

if __name__ == "__main__":
    main()