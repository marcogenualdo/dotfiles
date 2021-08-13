call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'
Plug 'editorconfig/editorconfig-vim' " file-type specific settings
Plug 'junegunn/goyo.vim'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Programming
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Look
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

call plug#end()
