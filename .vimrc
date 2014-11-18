" Trevor Perrier .vimrc
" Colors {{{
syntax enable " enable syntax processing
set t_Co=256 " enable 256 color
colorscheme vividchalk
" }}}
" Scapses & Tabs {{{
set tabstop=4
set softtabstop=4 " 4 space tab
filetype indent on
filetype plugin on
set autoindent
" }}}
"UI Layout {{{
set number  "show line numbers
set nocursorline " highlight current line
set wildmenu  " visual autocomplete for command menu
set wildignore=*.pyc,*~
set showmatch " highlight matching bracket
set modeline
set nocompatible
" }}}
" Searching {{{
" set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches
" }}}
" Folding {{{
set foldmethod=indent " fold based on indent level
" set foldnestmax=10 " max 10 depth
set foldlevelstart=10
set foldenable " don't fold files by default on open
" }}}
" Plugins {{{
" Set up Pathogen
call pathogen#infect()
call pathogen#helptags()

" NERDTree
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}
" vim: foldmethod=marker:foldlevel=0
