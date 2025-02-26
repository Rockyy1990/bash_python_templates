#!/usr/bin/env python3

import os
import time
import subprocess

# This is a Python script that demonstrates the basics of installing a program, managing a systemd service, creating a file in a directory,
# writing into a file using the tee -a equivalent, using an input function, and using a sleep function.

# Please note that some of these operations (like installing a program and managing systemd) typically require root privileges,
# so you may need to run the script with sudo or as a root user.

def install_program(program_name):
    """Install a program using apt package manager."""
    try:
        print(f"Installing {program_name}...")
        subprocess.run(['sudo', 'apt', 'install', '-y', program_name], check=True)
        print(f"{program_name} installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install {program_name}: {e}")


def manage_systemd(service_name, action):
    """Manage a systemd service (start, stop, restart, enable, disable)."""
    try:
        print(f"{action.capitalize()}ing {service_name} service...")
        subprocess.run(['sudo', 'systemctl', action, service_name], check=True)
        print(f"{service_name} service {action}ed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to {action} {service_name} service: {e}")


def create_file(directory, filename):
    """Create a file in the specified directory."""
    os.makedirs(directory, exist_ok=True)  # Create directory if it doesn't exist
    file_path = os.path.join(directory, filename)
    with open(file_path, 'w') as f:
        f.write("")  # Create an empty file
    print(f"File {file_path} created successfully.")


def write_to_file(file_path, content):
    """Append content to a file."""
    with open(file_path, 'a') as f:
        f.write(content + '\n')
    print(f"Content written to {file_path}.")


def main():
    # Install a program
    install_program('curl')  # Example program

    # Manage a systemd service
    manage_systemd('apache2', 'start')  # Example service

    # Create a file in a directory
    create_file('/tmp/my_directory', 'my_file.txt')

    # Write into a file
    write_to_file('/tmp/my_directory/my_file.txt', 'Hello, World!')

    # Input function
    user_input = input("Please enter some text to append to the file: ")
    write_to_file('/tmp/my_directory/my_file.txt', user_input)

    # Sleep function
    print("Sleeping for 5 seconds...")
    time.sleep(5)
    print("Awake!")

if __name__ == "__main__":
    main()
	
	

## Description of the Script:

 # Install a Program: The install_program function uses the apt package manager to install a specified program. It requires root privileges.

 # Manage Systemd: The manage_systemd function allows you to start, stop, restart, enable, or disable a systemd service using the systemctl command.

 # Create a File: The create_file function creates a specified file in a given directory. If the directory does not exist, it is created.

 # Write to a File: The write_to_file function appends content to a specified file. This mimics the behavior of tee -a.

 # Input Function: The script prompts the user for input and appends that input to the file.

 # Sleep Function: The script pauses execution for a specified number of seconds using time.sleep().

# In Python, imports are used to include external modules or libraries into your script, allowing you to use their functions, classes, and variables. This is essential for leveraging existing code and functionality without having to write everything from scratch.
# Common Imports for Installation and System Management Scripts


# When writing scripts for installation and system management, 
# you typically need to interact with the operating system, handle subprocesses, and manage files. 
# Here are some commonly used Python modules that are recommended for such tasks:

# os:
# Provides a way to use operating system-dependent functionality like reading or writing to the file system, 
# managing directories, and environment variables.
# Example usage: os.makedirs(), os.path.join(), os.remove(), etc.

# subprocess:
# Allows you to spawn new processes, connect to their input/output/error pipes, and obtain their return codes. This is particularly useful for executing shell commands (like installing packages or managing services).
# Example usage: subprocess.run(), subprocess.Popen(), etc.

# time:
# Provides various time-related functions, including sleep functionality, which can be useful for adding delays in scripts.
# Example usage: time.sleep().

# shutil:
# Offers a higher-level interface for file operations, such as copying and removing files or directories.
# Example usage: shutil.copy(), shutil.rmtree(), etc.

# sys:
# Provides access to some variables used or maintained by the interpreter and to functions that interact with the interpreter. 
# It can be useful for handling command-line arguments and exiting the script.
# Example usage: sys.exit(), sys.argv.

# platform:
#  Used to access underlying platform’s identifying data, which can be useful for writing cross-platform scripts.
#  Example usage: platform.system(), platform.release().

# argparse:
# A module for parsing command-line arguments. This is useful for making your scripts more flexible and user-friendly.
# Example usage: argparse.ArgumentParser().

# Note:
# Make sure to run this script in an environment where you have the necessary permissions to install packages and manage services.
# Adjust the program and service names as needed for your specific use case.
