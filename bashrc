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
  if [ -f .svn/entries ] 
  then
      parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
  fi
}
parse_svn_url() {
      cat .svn/entries | tail +5 | head -1
}
parse_svn_repository_root() {
      cat .svn/entries | tail +6 | head -1
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLACK="\[\033[0;30m\]"

export PS1="$GREEN[\u@\h \W$YELLOW\$(parse_git_branch)\$(parse_hg_branch)\$(parse_svn_branch)$GREEN]\\$ $BLACK"

alias ls="ls -G"
alias ll="ls -l"

export EDITOR=/usr/bin/vim
