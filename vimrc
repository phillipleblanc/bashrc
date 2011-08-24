set encoding=utf-8

set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

filetype on
filetype plugin on

syntax on

set ai

set number

set nocompatible

set showmatch

set backspace=indent,eol,start

if &term == "xterm-color"
  fixdel
endif

set ruler

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0
