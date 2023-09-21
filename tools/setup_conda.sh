
MINICONDA_DIR="$HOME/miniconda3"

# Check if Miniconda is already installed
if [ -d "$MINICONDA_DIR" ]; then
    echo "Miniconda is already installed at $MINICONDA_DIR."
    echo "Removing existing installation..."
    rm -rf "$MINICONDA_DIR"
fi

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

YAML_DIR="$HOME/.dotfiles/conda/envs/"

# Create and activate Conda environments from YAML files
for yaml_file in "$YAML_DIR"/*.yml; do
    if [ -f "$yaml_file" ]; then
        env_name=$(basename "$yaml_file" .yml)
        echo "Creating and activating Conda environment: $env_name"
        conda env create -f "$yaml_file"
        
    fi
done

# Provide instructions for additional environment setup and usage
echo "Conda installation and environment setup complete."

