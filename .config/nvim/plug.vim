call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'
Plug 'editorconfig/editorconfig-vim' " file-type specific settings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

" Look
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

call plug#end()
