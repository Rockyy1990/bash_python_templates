import os
import shutil

def create_directory(path):
    """Create a directory at the specified path."""
    try:
        os.makedirs(path)
        print(f"Directory '{path}' created successfully.")
    except FileExistsError:
        print(f"Directory '{path}' already exists.")
    except Exception as e:
        print(f"Error creating directory '{path}': {e}")

def remove_directory(path):
    """Remove a directory at the specified path."""
    try:
        shutil.rmtree(path)
        print(f"Directory '{path}' removed successfully.")
    except FileNotFoundError:
        print(f"Directory '{path}' does not exist.")
    except Exception as e:
        print(f"Error removing directory '{path}': {e}")

def create_file(file_path):
    """Create a file at the specified path."""
    try:
        with open(file_path, 'w') as f:
            pass  # Just create an empty file
        print(f"File '{file_path}' created successfully.")
    except Exception as e:
        print(f"Error creating file '{file_path}': {e}")

def remove_file(file_path):
    """Remove a file at the specified path."""
    try:
        os.remove(file_path)
        print(f"File '{file_path}' removed successfully.")
    except FileNotFoundError:
        print(f"File '{file_path}' does not exist.")
    except Exception as e:
        print(f"Error removing file '{file_path}': {e}")

def create_folder_in_directory(directory, folder_name):
    """Create a folder within a specified directory."""
    path = os.path.join(directory, folder_name)
    create_directory(path)

def write_to_file(file_path, content):
    """Write content to a file at the specified path."""
    try:
        with open(file_path, 'w') as f:
            f.write(content)
        print(f"Content written to file '{file_path}' successfully.")
    except Exception as e:
        print(f"Error writing to file '{file_path}': {e}")

def list_directory_contents(directory):
    """List the contents of a directory."""
    try:
        contents = os.listdir(directory)
        print(f"Contents of directory '{directory}':")
        for item in contents:
            print(f"- {item}")
    except FileNotFoundError:
        print(f"Directory '{directory}' does not exist.")
    except Exception as e:
        print(f"Error listing directory '{directory}': {e}")

# Example usage
if __name__ == "__main__":
    # Define paths
    dir_path = "example_dir"
    file_path = os.path.join(dir_path, "example_file.txt")
    subfolder_name = "subfolder"

    # Create directory
    create_directory(dir_path)

    # Create a subfolder in the directory
    create_folder_in_directory(dir_path, subfolder_name)

    # Create a file in the directory
    create_file(file_path)

    # Write to the file
    write_to_file(file_path, "Hello, World!")

    # List contents of the directory
    list_directory_contents(dir_path)

    # Remove the file
    remove_file(file_path)

    # Remove the directory
    remove_directory(dir_path)