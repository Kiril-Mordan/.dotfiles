# .dotfiles

Repository of configuration files. 
Environmental variables with `direnv` are used to 
hide sensitive information. Templated version of
`.envrc` file, where all the necessary environmental 
variables are suppose to be defined, is available and 
like other files is being filtered with `.gitattributes`
during commiting.

## Usage

1. Define environmental varaibles in `.envrc` file

2. Use installation script

   !!! Attention: The following script will overwrite existing files

   ```
   chmod +x install.sh
   ./install.sh
   ```

   The script will:

   - repopulate symlinks

   - install conda and conda environments from `conda/envs/`



