function parse_git_branch {
  if [ -d .git ]
  then
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " (git::"${ref#refs/heads/}")"
  fi
}

function parse_hg_branch {
  if [ -d .hg ]
  then
    branch=$(hg branch 2> /dev/null) || return
    echo " (hg::"${branch}")"
  fi
}

parse_svn_branch() {
  if [ -d .svn ] 
  then
    echo " (svn)"
  fi
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLACK="\[\033[0;30m\]"

export PS1="$GREEN[\u@\h \W$YELLOW\$(parse_git_branch)\$(parse_hg_branch)\$(parse_svn_branch)$GREEN]\\$ $YELLOW"

hash dircolors &>/dev/null && { alias ls="ls --color=auto"; eval `dircolors ~/.dir_colors`; } || { alias ls="gls --color=auto"; eval `gdircolors ~/.dir_colors`; }


alias ll="ls -l"

export EDITOR=/usr/bin/vim
