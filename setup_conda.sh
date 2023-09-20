#!/bin/bash


MINICONDA_DIR="$HOME/miniconda3"

# Determine the platform (Linux or macOS)
if [[ $(uname) == "Linux" ]]; then
    # Linux-specific installation
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
elif [[ $(uname) == "Darwin" ]]; then
    # macOS-specific installation
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
else
    echo "Unsupported operating system."
    exit 1
fi

# Download and install Miniconda
curl -o miniconda_installer.sh "$MINICONDA_URL"
bash miniconda_installer.sh -b -p "$MINICONDA_DIR"

# Provide instructions for additional environment setup and usage
echo "Conda installation and environment setup complete."
