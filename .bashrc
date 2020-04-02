# default files and directories to be for this user only
umask u=rwx,g=,o=

export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/snapd/desktop/applications/
export VISUAL=vim
export EDITOR="$VISUAL"

# this is an extension to cd that has history, cd --
source ~/dotfiles/acd_func.sh

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ssh='kitty +kitten ssh'

# fuzzy cd, z {fuzzy dest}
source ~/dotfiles/z/z.sh

PATH=~/bin:/home/jmoyers/.local/bin:/var/lib/snapd/snap/bin:$PATH

eval $(dircolors -b $HOME/dotfiles/.dircolors)

# ps1 colors for username
declare -a ps1_colors=($'\[\e[01;38;5;52m\]' $'\[\e[01;38;5;124m\]' \
  $'\[\e[01;38;5;196m\]' $'\[\e[01;38;5;202m\]' $'\[\e[01;38;5;208m\]' \
  $'\[\e[01;38;5;214m\]' $'\[\e[01;38;5;220m\]')

end_color=$'\[\e[0m\]'

ps1_username=""

for (( i=0; i<${#USER}; i++ )); do
  ps1_username=$ps1_username${ps1_colors[i]}${USER:$i:1}
done

ps1_host=$'\[\e[0;36;40m\]'$(hostname)
# by the way, 
ps1_location="\$(basename \$(pwd))"
#PS1="$ps1_username $ps1_host"
PS1="$ps1_username 🌱 $ps1_host $ps1_location$end_color > "
#🌱

# make it so ctrl-s doesn't freeze fucking bash
stty -ixon

# bash history stuff
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if nvm isn't installed for managing node.js version, this is harmless
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
