vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
  function(use)
    -- Meta
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'

    -- General
    use 'tpope/vim-sensible'
    use 'machakann/vim-highlightedyank'
    use 'machakann/vim-sandwich'
    use 'mbbill/undotree'
    use { 'junegunn/vim-easy-align', config = 'vim.cmd[[runtime ./plugconfig.easy-align.vim]]' }
    use 'editorconfig/editorconfig-vim' -- file-type specific settings
    use { 'unblevable/quick-scope', config = 'vim.cmd[[runtime ./plugconfig/quickscope.vim]]' }
    use { 'justinmk/vim-sneak', config = 'vim.cmd[[runtime ./plugconfig/sneak.vim]]' }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
      },
      config = 'vim.cmd[[runtime ./plugconfig/telescope.vim]]',
    }

    -- Programming
    use 'tpope/vim-fugitive'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-commentary'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons', -- for file icons
      },
      config = 'vim.cmd[[runtime ./plugconfig/tree.lua]]',
    }
    use 'jiangmiao/auto-pairs'

    -- Lsp
    use {
      'neovim/nvim-lspconfig',
      after = 'mason.nvim',
      config = 'vim.cmd[[runtime ./plugconfig/lsp.lua]]',
    }
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = 'vim.cmd[[runtime ./plugconfig/trouble.vim]]',
    }
    use 'sbdchd/neoformat'
    use 'simrat39/rust-tools.nvim'

    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind-nvim',
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      },
      config = 'vim.cmd[[runtime ./plugconfig/cmp.lua]]',
    }

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Look
    use {
      'nvim-lualine/lualine.nvim',
      config = 'vim.cmd[[runtime ./plugconfig/line.lua]]',
    }
    use {
      'tomasiser/vim-code-dark',
      setup = 'vim.g.codedark_transparent=1',
      config = 'vim.cmd[[colorscheme codedark]]',
    }
    use {
      "shortcuts/no-neck-pain.nvim",
      tag = "*",
      config = 'vim.cmd[[runtime ./plugconfig/no-neck-pain.lua]]',
    }
  end,
}
