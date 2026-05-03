-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete words with ctrl+backspace in insert mode
vim.keymap.set("i", "<C-BS>", "<C-w>")

vim.keymap.set("n", "-", "/")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "ZZ", function()
  vim.cmd("qa")
end)
vim.keymap.set("n", "zq", function()
  vim.cmd("q")
end)
vim.keymap.set("n", "ZQ", function()
  vim.cmd("q!")
end)

vim.api.nvim_create_user_command("Todo", function()
  local path = vim.fn.expand("~/todo.md")
  vim.cmd.edit(path)
end, { desc = "Open personal todo file" })

--  create a tmux session bound to this folder
local function spawn_term()
  local script = vim.fn.expand("~/.local/bin/pop-terminal.sh")
  -- Using vim.system for a clean, async execution
  vim.system({ "bash", script }, { detach = true })
end
vim.api.nvim_create_user_command("TmuxPair", spawn_term, { desc = "Launch tmux popup" })

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("TmuxPair")
end)

-- delete for good, without copying to clipboard
vim.keymap.set("n", "<leader>dd", '"ddd', { desc = "Delete line (no copy)" })
vim.keymap.set({ "n", "x" }, "<leader>d", '"dd', { desc = "Delete (no copy)" })

-- quickfix list
vim.keymap.set("n", "<C-n>", function()
  vim.cmd("cnext")
end)
vim.keymap.set("n", "<C-p>", function()
  vim.cmd("cprev")
end)

-- lsp diagnostics
vim.keymap.set("n", "g[", function()
  vim.diagnostic.get_next()
end)
vim.keymap.set("n", "g]", function()
  vim.diagnostic.get_prev()
end)

-- -- go to last opened buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- -- unhighlight
vim.keymap.set("n", "<leader>h", function()
  vim.cmd("noh")
end)
