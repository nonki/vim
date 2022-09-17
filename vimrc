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

" Git plugin to show changes in a file
Plugin 'airblade/vim-gitgutter'

" Status bar plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" Comment and uncomment code.
Plugin 'tpope/vim-commentary'

" Surround and de-surround text with cs, ds, ys, etc.
Plugin 'tpope/vim-surround'

" File tree browser plugin
Plugin 'preservim/nerdtree'

" File searching
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

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

" Keep the cursor vertically centered, where possible
set scrolloff=999

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

" Tabs
set showtabline=2
nnoremap L gt
nnoremap H gT
nnoremap <leader>ts :tab split<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" NERDTree bindings
" Map the <Leader>n key to toggle the NERDTree window
nnoremap <Leader>n :NERDTreeToggle<CR>

"
" }}}

" NERDTree ---------------------------------------------------------------- {{{
"
"
"

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=[ '\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$' ]

"
" }}}

" AIRLINE ---------------------------------------------------------------- {{{
"
"
"

" Set the theme for airline
let g:airline_theme='simple'

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set background=dark

set t_Co=256

" Use 256bit colour
let g:solarized_termcolors=256
" Use powerline font for nice VCS symbols for vim-airline
let g:airline_powerline_fonts=1

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


"
" }}}
