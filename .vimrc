" Trevor Perrier .vimrc
" Set up Pathogen {{{
" Set the filetype stuff to off, required for Pathogen
filetype off
filetype plugin indent off
execute pathogen#infect()
call pathogen#helptags()

" You can now turn it on again
filetype on
filetype indent plugin on
" }}}
" Genearl Settings {{{
set nocompatible " Fixs bugs -> like arrows making A B C D
set hidden " allow unsaved buffers
set nobackup
set noswapfile
" }}}
" Plugins {{{

" NERDTree
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vim-notes
let g:notes_directories = ['~/Documents/Notes']

" VimOrganizer
au! BufRead, BufWrite, BufWritePost, BufNewFile *.org
au BufEnter *.org call org#SetOrgFileType()
" }}}
" Colors {{{
syntax on " enable syntax processing
set t_Co=256 " enable 256 color
colorscheme vividchalk
hi Normal ctermbg=none " no background for vim
hi LineNr ctermbg=none "no background for line numbers
hi Folded ctermbg=41 ctermfg=22 " Dark green folding
" }}}
" Scapses & Tabs {{{
set tabstop=2
set softtabstop=2 " columns for tab in insert mode
set shiftwidth=2 " columns for indenting >> <<
set expandtab " replace spaces for tab
set autoindent
set copyindent
" }}}
"UI Layout {{{
set number  "show line numbers
set cursorline " highlight current line
set wildmenu  " visual autocomplete for command menu
set wildignore=*.pyc,*~
set showmatch " highlight matching bracket
set modeline " read modeline from files vim: options
set list listchars=tab:»·,eol:¶,trail:·,extends:⇒,precedes:⇐ " characters for whitespace
set nomousehide "don't hide the mouse cursor in gvim
" }}}
" Searching {{{
" set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches

" Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	"  Use ag in CtrlP for listing files. Lightning fast and respects
	"  .gitignore
  " let g:ctrlp_user_command = 'ag -l --nocolor -G "%s" .*'

	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0

endif

" }}}
" Folding {{{
set foldmethod=indent " fold based on indent level
" set foldnestmax=10 " max 10 depth
set foldlevelstart=10
set foldenable " don't fold files by default on open
" }}}
" vim: foldmethod=marker:foldlevel=0
