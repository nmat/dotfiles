"
" Author: nmat (nmat@users.noreply.github.com)
"
" This is my current working vimrc file
" Some of the settings are based on os x but you can
" ignore or remove them below
"

" General settings
set nocompatible
behave xterm
set term=xterm-256color
set showcmd
set ttyfast
set hidden
set number
set cursorline

" Set clipboard on MacVIM in OS X should work on Windows gvim also
" Meaning: hitting yy, d etc in macvim or gvim sends command to clipboard
set clipboard=unnamed

" Set to auto read when a file is changed from the outside
set autoread

" set height of commandbar
set cmdheight=2

" Don't redraw while executing macros
set lazyredraw

" Regular expressions
set magic

" Show matching brackets
set showmatch

" Always show current position
set ruler

" don't use backup and swapfile
set nobackup
set noswapfile

" Remember more command history
set history=1000

" Use more levels of undo
set undolevels=1000

" Set the terminal title
set title

" don't beep
set visualbell
set noerrorbells
set t_vb=
set tm=500

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set the tab stop to 4 spaces
set tabstop=2
set shiftwidth=2

" Spaces are better than tabs
set expandtab
set smarttab

" Tab completion
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class

" Auto indent, smart indent and wrap lines
set autoindent
set smartindent
set wrap

" Set highlight on searched words
set hlsearch

" Set the lines to increment search
set incsearch

" Ignore case when searching
set ignorecase

" Try to be smart about cases
set smartcase

" blink matching brackets
set mat=2

" Set utf8 as standard encoding
set encoding=utf-8

" Use unix as standard file type
set ffs=unix,dos,mac

" Enable syntax highlight
if &t_Co >= 256 || has("gui_running")
    colorscheme vividchalk
    "colorscheme molokai
    set background=dark
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlight on, when terminal has colors
    syntax on
endif

if has ("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

" Return to last line edited when opening file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

" Remember buffer about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ Col:\ %c

" Mac OS X keybindings
map <ESC>[H <Home>
map <ESC>[F <End>
imap <ESC>[H <C-O><Home>
imap <ESC>[F <C-O><End>
cmap <ESC>[H <Home>
cmap <ESC>[F <End>

" Add \c to be used for Mac OS X clipboard
nnoremap <silent> <Leader>c :Copy<CR>
vnoremap <silent> <Leader>c :Copy<CR>

command! -range Copy call DoCopy(<line1>, <line2>)

func! DoCopy(sline, eline)
  exec ':'. a:sline . ',' . a:eline . 'w !pbcopy'
  redraw
  echohl ModeMsg
  echon "Copied lines " a:sline "-" a:eline " to system clipboard"
  echohl None
endfunc

" Remap VIM 0 to first non-blank character
map 0 ^

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
        return ''
endfunction

" Delete trailing white space on save, useful for python
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Set statusline
hi StatColor guibg=lightgrey guifg=black ctermbg=lightgrey ctermfg=black
hi Modified guibg=#ff0000 guifg=black ctermbg=196 ctermfg=black
hi statusline guibg=#303030 guifg=#bcbcbc ctermfg=250 ctermbg=236

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline .= "%#StatColor#"
    endif
    let statusline .= "\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline .= "%*"
    endif
    let statusline .= "%#Modified#%m"
    if a:mode == 'Leave'
        let statusline .= "%*%r"
    elseif a:mode == 'Enter'
        let statusline .= "%r%*"
    endif
    let statusline .= "\ %{HasPaste()}%\  (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=green ctermbg=green
  elseif a:mode == 'r'
    hi StatColor guibg=red ctermbg=red
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatusLineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=lightgrey guifg=black ctermbg=lightgrey ctermfg=black
