#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
TARGET_DIR="$HOME"

# List of files to be ignored (replace with your specific filenames)
IGNORE_FILES=(".DS_Store" "README.md" ".git" ".gitignore")

# Function to check if a file should be ignored
should_ignore() {
    local filename="$1"
    for ignore_file in "${IGNORE_FILES[@]}"; do
        if [ "$filename" == "$ignore_file" ]; then
            return 0 # File should be ignored
        fi
    done
    return 1 # File should not be ignored
}

# Function to create symlinks for dot files in a folder, overwriting existing files if needed
create_symlinks() {
    local source_dir="$1"
    local target_dir="$2"

    # Use find to locate dot files within the source directory and its subfolders
    find "$source_dir" -type f -name ".*" -not -name ".DS_Store" | while read -r source_file; do
        local filename=$(basename "$source_file")
        local target_file="$target_dir/$filename"

        # Check if the file should be ignored
        if should_ignore "$filename"; then
            echo "Ignoring $filename"
        else
            if [ -e "$target_file" ] || [ -L "$target_file" ]; then
                # If a file or symlink with the same name exists, remove it before creating a symlink
                rm -f "$target_file"
            fi
            ln -s "$source_file" "$target_file"
        fi
    done
}

# Function to recursively create symlinks for dot files in subfolders, overwriting existing files if needed
create_symlinks_recursive() {
    local root_dir="$1"

    # Use find to locate subdirectories within the root directory
    find "$root_dir" -type d -print0 | while IFS= read -r -d '' subfolder; do
        create_symlinks "$subfolder" "$TARGET_DIR"
    done
}

# Create symlinks for dot files in the root directory of the dotfiles repository
create_symlinks "$DOTFILES_DIR" "$TARGET_DIR"

# Recursively create symlinks for dot files in subfolders, overwriting existing files if needed
#create_symlinks_recursive "$DOTFILES_DIR"

