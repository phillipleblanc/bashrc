""""""""""
" syntax "
""""""""""

" turn code syntax highlighting on
syntax enable

" automatic file type detection
filetype on                     

""""""""
" evil "
""""""""

" don't emulate vi bugs/strange behavior
set nocompatible               

" modelines are a security risk
set modelines=0

" allow buffer switching without saves
set hidden

""""""""""""""
" whitespace "
""""""""""""""

" set tab width to 4
set tabstop=4 shiftwidth=4 

" tabs = spaces
set expandtab

""""""
" io "
""""""

" auto-switch to each buffer's cwd
set autochdir

" watch for file changes by other programs
set autoread                   

" auto write files on exit
set autowrite autowriteall

""""""
" ex "
""""""

" turn on command line completion wild style
set wildmenu wildmode=list:longest       
                   
" number of lines of command line history
set history=100                 

" number of undo levels
set undolevels=200              

" wrap cursor at line endings and beginnings
set whichwrap=b,s,h,l,<,>,~,[,] 

"""""""""""
" display "
"""""""""""

" highlight searches
set hlsearch                    

" show the cursor position all the time
set ruler                       

" show line numbers
set number                      

" show right margin
set cc=81

" set the guifont
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

" tell vim we support 16 colors if in xterm or friends
if &term == "linux"
  set t_Co=8
else
  set t_Co=16
endif

set backspace=2

"""""""""""""""
" keybindings "
"""""""""""""""

noremap <F1> <Esc>
inoremap <F1> <Esc>
noremap K <Nop>

""""""""""""
" commands "
""""""""""""

" toggle spell checking
command! -nargs=0 Spl
\ setlocal spell!

" toggle tab width between 2 and 4
fu! ToggleTabStop()
  if &tabstop == 2
    echo "Setting tab width from " . &tabstop . " to 4." 
    set tabstop=4
  else 
    echo "Setting tab width from " . &tabstop . " to 2." 
    set tabstop=2
  endif 
endf

command! -nargs=0 Ts call ToggleTabStop()

" toggle what the tab key inserts (e.g. tabs or spaces)
fu! ToggleTabKey()
  if &expandtab
    echo "Disabling expandtab"
    set noexpandtab 
  else 
    echo "Enabling expandtab"
    set expandtab 
  endif 
endf

command! -nargs=0 Tk call ToggleTabKey()

" insert a C++-style UUID identifier at the cursor
command! -nargs=0 UUID
\ exe ":put! ='" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "'"

" insert a C++-style UUID identifier at the cursor
command! -nargs=0 UUname
\ exe ":put! ='uuid_" .
\     substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge") .
\     "'"

" insert a C++-style UUID string at the cursor
command! -nargs=0 UUstr
\ exe ":put! ='\\\"" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "\\\"'"

" replace %%UUID%% with a UUID 
command! -nargs=0 UUrep
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"

" auto-replace %%UUID%% with a UUID in C++ and C headers
au! BufWrite *.ipp,*.hpp,*.hxx,*.hh,*.H,*.h
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"

""""""""""
" syntax "
""""""""""

set background=dark

hi clear

let g:colors_name = "ron"

hi clear Visual
hi Visual term=reverse cterm=reverse gui=reverse

hi Normal  guifg=white guibg=black ctermfg=white ctermbg=black
hi NonText guifg=blue  ctermfg=blue

hi Comment    guifg=cyan        ctermfg=cyan
hi Constant   guifg=magenta     ctermfg=magenta
hi String     guifg=darkmagenta ctermfg=darkmagenta
hi Identifier guifg=white       ctermfg=white 
hi Statement  guifg=yellow      ctermfg=yellow 
hi Preproc    guifg=blue        ctermfg=blue 
hi Type       guifg=green       ctermfg=green
hi Special    guifg=yellow      ctermfg=yellow
hi Label      guifg=yellow      ctermfg=yellow
hi Operator   guifg=blue        ctermfg=blue

hi Error    ctermfg=black ctermbg=darkred guifg=black guibg=darkred
hi ErrorMsg ctermfg=black ctermbg=darkred guifg=black guibg=darkred

hi WarningMsg ctermfg=black ctermbg=darkyellow guifg=black guibg=darkyellow
hi Todo       ctermfg=black ctermbg=darkgreen  guifg=black guibg=darkgreen

hi Search    ctermbg=yellow guibg=yellow
hi IncSearch ctermbg=yellow guibg=yellow 

hi LineNr ctermfg=yellow guifg=yellow

hi DiffChange ctermbg=green guibg=green
hi DiffText   ctermbg=white guibg=white
hi DiffAdd    ctermbg=blue  guibg=blue
hi DiffDelete ctermbg=red   guibg=red

hi ColorColumn ctermbg=darkgrey guibg=darkgrey

set foldmethod=marker

