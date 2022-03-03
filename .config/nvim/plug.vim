call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'
Plug 'editorconfig/editorconfig-vim' " file-type specific settings
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" General Lua
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Programming
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'sbdchd/neoformat'
Plug 'simrat39/rust-tools.nvim'
Plug 'folke/trouble.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Look
Plug 'nvim-lualine/lualine.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/goyo.vim'

call plug#end()
