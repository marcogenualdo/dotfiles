-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
vim.opt.wrap = true

-- experimental native message/cmdline UI (nvim 0.12+): no "Press ENTER", highlighted cmdline
-- conflicts with noice.nvim (both take over messages/cmdline), which is disabled in plugins/disabled.lua
pcall(function()
  require("vim._core.ui2").enable({})
end)
