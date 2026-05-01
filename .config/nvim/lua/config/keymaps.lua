-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete words with ctrl+backspace in insert mode
vim.keymap.set("n", "<C-BS>", "<C-w>")

vim.keymap.set("n", "-", "/")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "ZZ", "<cmd>qa<cr>")
vim.keymap.set("n", "zq", "<cmd>q<cr>")
vim.keymap.set("n", "ZQ", "<cmd>q!<cr>")

vim.api.nvim_create_user_command("Todo", "edit ~/todo.md", {})

--  create a tmux session bound to this folder
vim.api.nvim_create_user_command("TmuxPair", "!bash ~/.local/bin/pop-terminal.sh > /dev/null 2>&1", {})
vim.keymap.set("n", "<leader>t", "<cmd>TmuxPair<cr><cr>")

-- delete for good, without copying to clipboard
vim.keymap.set("n", "<leader>dd", "_dd")
vim.keymap.set("n", "<leader>d", "_d")
vim.keymap.set("n", "<leader>d", "_d")

-- quickfix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<cr>")

-- lsp diagnostics
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

-- -- go to last opened buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- -- unhighlight
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>")
