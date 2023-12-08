---------------------------------
-- VIM OPTIONS

vim.opt.cursorline = false
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true


---------------------------------
-- PLUGINS

lvim.builtin.bufferline.active = false
lvim.builtin.alpha.active = false

lvim.plugins = {
  {
    "Mofiqul/vscode.nvim",
    config = {
      transparent = true,
      italic_comments = true,
      disable_nvimtree_bg = true,
    }
  },
  { "tpope/vim-surround" },
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

vim.api.nvim_create_user_command("Todo", "edit ~/todo.md", {})

--  create a tmux session bound to this folder
vim.api.nvim_create_user_command("TmuxPair", "!bash ~/.config/nvim/pop-terminal.sh > /dev/null 2>&1", {})
lvim.keys.normal_mode["<leader>t"] = "<cmd>TmuxPair<cr><cr>"

-- delete for good, without copying to clipboard
lvim.keys.normal_mode["<leader>dd"] = "_dd"
lvim.keys.normal_mode["<leader>d"] = "_d"
lvim.keys.normal_mode["<leader>d"] = "_d"

-- quickfix list
lvim.keys.normal_mode["<C-n>"] = "<cmd>cnext<cr>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>cprev<cr>"

-- -- next/previous tab
lvim.builtin.which_key.mappings["m"] = { "<cmd>tabn<cr>", "Navigation" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>tabp<cr>", "Navigation" }

-- -- go to last opened buffer
lvim.builtin.which_key.mappings["<leader>"] = { "<C-^>", "Navigation" }

-- -- unhighlight
lvim.keys.normal_mode["<C-h>"] = "<cmd>noh<cr>"

-- -- telescope
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i = {
  ["<C-k>"] = actions.move_selection_previous,
  ["<C-j>"] = actions.move_selection_next,
  ["<C-f>"] = actions.send_selected_to_qflist,
}
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope find_files<cr>", "Telescope" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope find_files<cr>", "Telescope" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>Telescope live_grep<cr>", "Telescope" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>Telescope command_history<cr>", "Telescope" }
lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Telescope" }
