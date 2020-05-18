call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'

" Programming
Plug 'neoclide/coc.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

" Look
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()


" Basics
syntax on "syntax highlighting  
set nocompatible  "Set compatibility to Vim only.
set encoding=utf-8
"set termguicolors

" Use system clipboard
set clipboard+=unnamedplus

" Automatically wrap text that extends beyond the screen length.
set wrap

" Show relative line numbers
highlight LineNr ctermfg=grey
set ruler
set number relativenumber

" Case sensitive search only when a capital letter is in the search pattern
set ignorecase
set smartcase

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling in Vim
set ttyfast

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
