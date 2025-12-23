---------------------------------
-- VIM OPTIONS

vim.opt.cursorline = false
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true


---------------------------------
-- PLUGINS

lvim.builtin.bufferline.active = false
lvim.builtin.alpha.active = false
lvim.builtin.illuminate.active = false

lvim.plugins = {
  {
    "Mofiqul/vscode.nvim",
    config = {
      transparent = true,
      italic_comments = true,
      disable_nvimtree_bg = true,
    }
  },
  { "machakann/vim-sandwich" },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-S>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>P", function() toggle_telescope(harpoon:list()) end)
      vim.keymap.set("n", "<leader>p", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-a>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-s>", function() harpoon:list():next() end)
    end,
  },
  {
    "junegunn/vim-easy-align",
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
    end
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
      })
    end
  },
  { "grafana/vim-alloy" }
}

-- look
lvim.colorscheme = "vscode"
lvim.builtin.lualine.options = {
  theme = 'powerline',
  globalstatus = true,
  component_separators = '',
  section_separators = { left = '', right = '' },
}


---------------------------------
-- KEYBINDS

-- delete words with ctrl+backspace in insert mode
lvim.keys.normal_mode["<C-BS>"] = "<C-w>"
lvim.keys.normal_mode["<C-h>"] = "<C-w>"

lvim.keys.normal_mode["-"] = "/"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["ZZ"] = "<cmd>qa<cr>"
lvim.keys.normal_mode["zq"] = "<cmd>q<cr>"
lvim.keys.normal_mode["ZQ"] = "<cmd>q!<cr>"

vim.api.nvim_create_user_command("Todo", "edit ~/todo.md", {})

--  create a tmux session bound to this folder
vim.api.nvim_create_user_command("TmuxPair", "!bash ~/.config/lvim/pop-terminal.sh > /dev/null 2>&1", {})
lvim.keys.normal_mode["<leader>t"] = "<cmd>TmuxPair<cr><cr>"

-- delete for good, without copying to clipboard
lvim.keys.normal_mode["<leader>dd"] = "_dd"
lvim.keys.normal_mode["<leader>d"] = "_d"
lvim.keys.normal_mode["<leader>d"] = "_d"

-- quickfix list
lvim.keys.normal_mode["<C-n>"] = "<cmd>cnext<cr>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>cprev<cr>"

-- lsp diagnostics
lvim.keys.normal_mode["g["] = "<cmd>lua vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["g]"] = "<cmd>lua vim.diagnostic.goto_prev()<cr>"

-- -- next/previous tab
lvim.builtin.which_key.mappings["m"] = { "<cmd>tabn<cr>", "Navigation" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>tabp<cr>", "Navigation" }

-- -- go to last opened buffer
lvim.builtin.which_key.mappings["<leader>"] = { "<C-^>", "Navigation" }

-- -- unhighlight
lvim.builtin.which_key.mappings["h"] = { "<cmd>noh<cr>", "Selection" }

-- -- telescope
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i = {
  ["<C-k>"] = actions.move_selection_previous,
  ["<C-j>"] = actions.move_selection_next,
  ["<C-f>"] = actions.send_selected_to_qflist,
}
lvim.builtin.telescope.defaults.path_display = { "absolute" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope find_files<cr>", "Telescope" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>Telescope live_grep<cr>", "Telescope" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>Telescope command_history<cr>", "Telescope" }
lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Telescope" }


---------------------------------
-- CODE

-- formatting
lvim.format_on_save.enabled = true
