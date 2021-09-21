let mapleader=" "


"""""""""""""""""""""""""""""""""
" PLUGINS
runtime ./plug.vim


" !on installation run %s/#1E1E1E/#111111/g in colors.vim
colorscheme codedark


"""""""""""""""""""""""""""""""""
" DEPENDENCIES

" should use system neovim packages
let g:python3_host_prog = '/bin/python'


"""""""""""""""""""""""""""""""""
" BASICS

syntax on
set encoding=utf-8
set termguicolors
set noswapfile
set smartindent
set incsearch  " Show search result as you type
set mouse+=a  " Enable mouse
set modeline  " Read file first line as vim instructions
set hidden  " Allow buffer switching without saving
set clipboard+=unnamedplus  " Use system clipboard
set wrap  " Automatically wrap text that extends beyond the screen length.
set iskeyword+=-  " Treat kebab-cased words as one word object
set scrolloff=5  " Display 5 lines above/below the cursor when scrolling with a mouse.
set matchpairs+=<:>  " Highlight matching pairs of brackets

" Show relative line numbers
highlight LineNr ctermfg=grey
set ruler
set number relativenumber

" Commands options
set showcmd

set wildmenu
set wildignore+=**/node_modules/**


"""""""""""""""""""""""""""""""""
" COMMANDS

" j/k will move virtual lines (lines that wrap)
" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap Y y$
nnoremap <silent> ZZ <cmd>qa<cr>
nnoremap <silent> zq <cmd>q<cr>

command Todo <cmd>e ~/todo.md

" create a tmux session bound to this folder
command TmuxPair execute "!bash ~/.config/nvim/pop-terminal.sh > /dev/null 2>&1"
nnoremap <silent> <leader>t <cmd>TmuxPair<cr><cr>

" delete for good, without copying to clipboard
nnoremap <leader>D "_d
vnoremap <leader>D "_d

" quickfix list
nnoremap <C-n> <cmd>cnext<cr>
nnoremap <C-p> <cmd>cprev<cr>

" auto-create xml tags
inoremap <buffer> <C-x> <esc>yiwi<lt><esc>ea></><esc>hpF>a


"""""""""""""""""""""""""""""""""
" NAVIGATION

" Sane splits
set splitright
set splitbelow

" Switch window split
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" next/previous tab
nnoremap <silent> <leader>m <cmd>tabn<cr>
nnoremap <silent> <leader>n <cmd>tabp<cr>

" go to last opened buffer
nnoremap <leader><leader> <C-^>

" resize panes
nmap <leader>L <cmd>vertical resize +10<cr>
nmap <leader>H <cmd>vertical resize -10<cr>
nmap <leader>J <cmd>resize +5<cr>
nmap <leader>K <cmd>resize -5<cr>


"""""""""""""""""""""""""""""""""
" SEARCH

" case sensitive search only when a capital letter is in the search pattern
set ignorecase
set smartcase

" unhighlight, think 'deSelect'
nmap <silent> <leader>d <cmd>noh<cr>

" keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Indentation
set smarttab
set cindent
set expandtab  " always uses spaces instead of tab characters


"""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS

runtime ./plugconfig/lightline.vim
runtime ./plugconfig/easy-align.vim
runtime ./plugconfig/sneak.vim
runtime ./plugconfig/telescope.vim
runtime ./plugconfig/quickscope.vim
runtime ./plugconfig/goyo.vim
runtime ./plugconfig/lsp.vim
runtime ./plugconfig/nerdtree.vim
