autoload -U colors && colors
#PS1="[%{$fg[red]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}]$ % "
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="[%{$fg[red]%}%m%{$reset_color%}]$ % "

export SYSTEM_VERSION_COMPAT=0

alias zaratustra='cd ~/Documents/Books/German/'
alias zshrc='vim ~/.zshrc'
alias jupyter-labc='conda activate; jupyter-lab'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#Plugins

plugins=(
osx
last-working dir
)


# The following lines were added by compinstall
zstyle :compinstall filename '/Users/insani_dei/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add syntax-highliting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/insani_dei/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/insani_dei/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/insani_dei/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/insani_dei/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#conda config --set auto_activate_base False
alias cp="cp -r"
