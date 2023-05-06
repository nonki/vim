" VIM-PLUG ------------------------------------------------------ {{{
"
"
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Git plugin, available through :G or :Git.
Plug 'tpope/vim-fugitive'

" Git plugin to show changes in a file
Plug 'airblade/vim-gitgutter'

" Status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'sainnhe/everforest'

" Comment and uncomment code.
Plug 'tpope/vim-commentary'

" Surround and de-surround text with cs, ds, ys, etc.
Plug 'tpope/vim-surround'

" File tree browser plugin
Plug 'preservim/nerdtree'

" File searching
Plug 'ctrlpvim/ctrlp.vim'

" Code completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Golang support
Plug 'fatih/vim-go'

Plug 'sheerun/vim-polyglot'

Plug 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

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

" Make backspace work properly (e.g. traverse line breaks)
set backspace=indent,eol,start

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

" vim-go keybinds
nnoremap <Leader>gl :GoAlternate<CR>
nnoremap <Leader>gtt :GoTest<CR>
nnoremap <Leader>gtf :GoTestFunc<CR>

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

"i NERDTree ---------------------------------------------------------------- {{{
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

" Important!!
set termguicolors

" Set the theme for airline
let g:airline_theme='everforest'

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set background=dark

"set t_Co=256

" Use 256bit colour
let g:solarized_termcolors=256

" Use powerline font for nice VCS symbols for vim-airline
let g:airline_powerline_fonts=1

" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
" For better performance
let g:everforest_better_performance = 1
colorscheme everforest

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

" COC ------------------------------------------------------------ {{{
"
"
"

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"
" }}}

" VIM-GO ------------------------------------------------------------ {{{
"
"
"

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform= 'camelcase'

"
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
"
"
"


"
" }}}

" YAML -------------------------------------------{{{
"
"
"

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"
"
" }}}

" FOLDING ------------------------------ {{{
"
"

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"
"}}}

set list
set listchars=tab:\|·,trail:`,multispace:\|···

" Automatically change the screen title
set title
" Show the current cursor position in the status line
set ruler
" Always show the status line
set laststatus=2
" Highlight the line the cursor is currently on
set cursorline
" Draw a vertical line at 120 characters
set colorcolumn=120
" Enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1
" Just use one character to highlight indent level rather than highlighting
" the full indent block
let g:indent_guides_guide_size = 1
" Start indent guides from level 2 - no need to see it on column 1
let g:indent_guides_start_level = 2
" Use custom colours for indent guides (subtly darker than Molokai CursorColumn)
let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd  guibg=#39382d
highlight IndentGuidesEven guibg=#39382d

" Remove trailing spaces when saving a buffer
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Functions
"-----------

" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" hide abandoned buffers
set hidden
