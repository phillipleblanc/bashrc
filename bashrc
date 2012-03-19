# ~/.bashrc - executed on interactive user login through BASH

# bail if we are not interactive
if [ -z "$PS1" ]; then
  return
fi

shopt -s histappend

shopt -s checkwinsize

set -o vi

# pretty prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  PS1='\[\033[31m\][\t]\[\033[00m\]:\[\033[33m\]\u@\H\[\033[00m\]:\[\033[34m\]$PWD\[\033[00m\]\$ '
else
  PS1='[\t]:\u@\H:$PWD\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Uncomment this to enable GPG agent
#. $HOME/.launch_gpg_agent.sh

export EDITOR=vim

# ls aliases
alias ll='ls -A -l'
alias la='ls -A'
