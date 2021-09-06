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
let g:node_host_prog = '/bin/node'


"""""""""""""""""""""""""""""""""
" BASICS

syntax on "syntax highlighting
set nocompatible  "Set compatibility to Vim only.
set encoding=utf-8
set termguicolors
set noswapfile
set smartindent
set incsearch
set mouse+=a
set modeline

" Use system clipboard
set clipboard+=unnamedplus

" Automatically wrap text that extends beyond the screen length.
set wrap

" Show relative line numbers
highlight LineNr ctermfg=grey
set ruler
set number relativenumber

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling
set ttyfast

" Commands options
set showcmd

set wildmenu
set wildignore+=**/node_modules/**

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" j/k will move virtual lines (lines that wrap)
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" copy till the end of the line
nnoremap Y y$


"""""""""""""""""""""""""""""""""
" NAVIGATION

" Sane splits
set splitright
set splitbelow

" better window splits
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" next/previous tab
nnoremap <silent> <leader>m :tabn<CR>
nnoremap <silent> <leader>n :tabp<CR>

" go to last opened buffer
nnoremap <leader><leader> <C-^>

" resizing panes
nmap <leader>L :vertical resize +10<CR>
nmap <leader>H :vertical resize -10<CR>
nmap <leader>J :resize +5<CR>
nmap <leader>K :resize -5<CR>


"""""""""""""""""""""""""""""""""
" SEARCH

" case sensitive search only when a capital letter is in the search pattern
set ignorecase
set smartcase

" unhighlight, think 'deSelect'
nmap <leader>d :noh<cr>

" keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Indentation
set smarttab
set cindent
"set tabstop=2
"set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab


"""""""""""""""""""""""""""""""""
" PAGER SETTINGS

let $PAGER=''


"""""""""""""""""""""""""""""""""
" COMMANDS

nnoremap qq :qa<CR>
command Todo :e ~/todo.md

" create a tmux session bound to this folder
command TmuxPair execute "!bash ~/.config/nvim/pop-terminal.sh > /dev/null 2>&1"
nnoremap <silent> <leader>t :TmuxPair<CR><CR>

" delete for good, without copying to clipboard
nnoremap <leader>D "_d
vnoremap <leader>D "_d

" auto-create xml tags
inoremap <buffer> <C-x> <esc>yiwi<lt><esc>ea></><esc>hpF>a


"""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS

runtime ./plugconfig/lightline.vim
runtime ./plugconfig/easy-align.vim
runtime ./plugconfig/sneak.vim
runtime ./plugconfig/coc.vim
runtime ./plugconfig/telescope.vim
runtime ./plugconfig/quickscope.vim
