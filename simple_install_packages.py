#!/usr/bin/env python3

import subprocess
import sys

def install_packages(packages):
    """Install a list of packages using apt."""
    try:
        # Update the package list
        subprocess.run(['sudo', 'apt', 'update'], check=True)

        # Install each package
        for package in packages:
            print(f"Installing {package}...")
            subprocess.run(['sudo', 'apt', 'install', '-y', package], check=True)
            print(f"{package} installed successfully.")
    
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while installing packages: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # List of packages to install
    packages_to_install = [
        'git',
        'curl',
        'vim',
        'htop',
        'build-essential',
        'python3-pip',
        'docker.io',
        'nodejs',
        'npm'
    ]

    install_packages(packages_to_install)