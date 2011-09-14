
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLACK="\[\033[0;30m\]"

export PS1="$GREEN[\u@\h \W$YELLOW\$(__git_ps1 \" (%s)\")$GREEN]\\$ $YELLOW"

hash dircolors &>/dev/null && { alias ls="ls --color=auto"; eval `dircolors ~/.dir_colors`; } || { alias ls="gls --color=auto"; eval `gdircolors ~/.dir_colors`; }

export PATH=$PATH:/usr/bin:/usr/sbin:/sbin:/bin


alias ll="ls -l"

export EDITOR=/usr/bin/vim
export BOOST=/home/pleblanc/Projects/boost_1_47_0
