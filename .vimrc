" Trevor Perrier .vimrc
" Set up Pathogen {{{
" Set the filetype stuff to off, required for Pathogen
filetype off
filetype plugin indent off

execute pathogen#infect()
call pathogen#helptags()

" You can now turn it on again
filetype on
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
filetype indent plugin on
set autoindent
" }}}
"UI Layout {{{
set number  "show line numbers
set cursorline " highlight current line
set wildmenu  " visual autocomplete for command menu
set wildignore=*.pyc,*~
set showmatch " highlight matching bracket
set modeline " read modeline from files vim: options
set nocompatible " Fixs bugs -> like arrows making A B C D
set list listchars=tab:»·,eol:¶,trail:·,extends:⇒,precedes:⇐ " characters for whitespace
set nowrap " No line wraping by default
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
	 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

endif

" }}}
" Folding {{{
set foldmethod=indent " fold based on indent level
" set foldnestmax=10 " max 10 depth
set foldlevelstart=10
set foldenable " don't fold files by default on open
" }}}
" Plugins {{{

" VimOrganizer
" au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
" au BufEnter *.org call org#SetOrgFileType()

" NERDTree
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}
" vim: foldmethod=marker:foldlevel=0
