" Trevor Perrier .vimrc

" Switching from Pathogen to vim-plug: 2017-03-31
" begin vim-plug section
" Directions are here: https://github.com/junegunn/vim-plug.
" To install vim-plug 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" " This section is for vim-plug managed plugins.
" " :PlugInstall to install them.
"

call plug#begin('~/.vim/plugged')

" file browser on the left
Plug 'scrooloose/nerdtree'
" surround things with other things
Plug 'tpope/vim-surround'

" Allow . repeating using vim-surround
Plug 'tpope/vim-repeat'

" Commenting with gc{motion}
Plug 'tomtom/tcomment_vim'

" Auto-conversion to snake, camel, mixed, upper  case with crs, crc, crm, cru
Plug 'tpope/vim-abolish'

" more sane regex
Plug 'nelstrom/vim-visual-star-search'

" Better markdown support
Plug 'plasticboy/vim-markdown'

" Add plugins to &runtimepath
call plug#end()
" end vim-plug section


" Genearl Settings {{{
set nocompatible " Fixs bugs -> like arrows making A B C D
set hidden " allow unsaved buffers
set nobackup
set noswapfile
set autoread "auto read files with external changes
filetype plugin on
filetype indent on

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
" Spaces & Tabs {{{
set tabstop=2
set softtabstop=2 " columns for tab in insert mode
set shiftwidth=2 " columns for indenting >> <<
set expandtab " replace spaces for tab
set autoindent
set copyindent
set ai "Auto indent
set si "Smart indent
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
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
map q: <Nop> 
" }}}
" Searching {{{
" set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches
" Don't redraw while executing macros (good performance config)
set lazyredraw 
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
" Buffer Management{{{
nnoremap <Leader>l :ls<CR>:b 
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :b#<CR>
" }}}
"

" Automatically change the statusline color depending on mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=Green ctermfg=2 guifg=Black ctermbg=0

" default the statusline to green when entering Vim
hi statusline guibg=Green ctermfg=2  guifg=Black ctermbg=0


" Formats the statusline
set laststatus=2
set statusline=[%n]\ %f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]\  "file format
set statusline+=%y\      "filetype
set statusline+=%h\      "help file flag
set statusline+=%m\      "modified flag
set statusline+=%r\     "read only flag

set statusline+=\ %=                        " align left
set statusline+=\ [%3.b][0x%3.B]\               " ASCII and byte code under cursor
set statusline+=%2.c:%l/%L\ [%3.p%%]            " line X of Y [percent of file]

" }}}
" Key Mappings {{{
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" nnoremap <silent><c-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><c-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><c-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><c-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" }}}
