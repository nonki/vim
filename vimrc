" VUNDLE ------------------------------------------------------ {{{
" 
"   
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git plugin, available through :G or :Git.
Plugin 'tpope/vim-fugitive'

" File tree browser plugin
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" }}}

" VIEW PREFERENCES ------------------------------------------------------ {{{
" 
"   
"

" Show numbered lines
set number

"
" }}}

" SYNTAX HIGHLIGHTING ---------------------------------------------------- {{{
" 
"   
"

" Enable syntax highlighting
syntax on

"
" }}}

" CODE FORMATTING ---------------------------------------------------- {{{
" 
"   
"

set shiftwidth=4

set tabstop=4

set softtabstop=4

"
" }}}

" SEARCH ------------------------------------------------------------ {{{
" 
"   
"

" Ignore capital letters during search.
set ignorecase

" Ignore capital letters during search.
set smartcase

" While searching though a file incrementally highlight matching characters as
" you type.
set incsearch

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

"
" }}}

" WILD MODE ------------------------------------------------------------ {{{
" 
"   
"

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Enable auto completion menu after pressing TAB.
set wildmenu

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"
" }}}

" KEY BINDINGS------------------------------------------------------------ {{{
" 
" Various key bindings
"

" Use jk for exiting insert mode
inoremap jk <Esc>

" Make <Space> the <Leader> key instead of the default \
let mapleader = ' ' 

" Disable search highlighting with leader and backslash
nnoremap <Leader>\ :nohlsearch<CR>

" Type : in command mode with ,
nnoremap , :

" Map <Leader>jk to reload vimrc while working on it
nnoremap <Leader>jk :source ~/.vim/vimrc<CR>

" Easy window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" NERDTree bindings
" Map the <Leader>n key to toggle the NERDTree window
nnoremap <Leader>n :NERDTreeToggle<CR>

"
" }}}

" NERDTree ---------------------------------------------------------------- {{{

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

"
" }}}

" VIM SCRIPT --------------------------------------------------------------- {{{
"
" Mappings code goes here.
"

" This will enable code folding.
" " Use the marker method of folding.
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

"
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
"
"
"

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"
" }}}
