return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>o",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>r",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
  },
  opts = {
    zen = {
      toggles = {
        dim = false,
      },
    },
    dashboard = {
      preset = {
        header = "",
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Ensures colors persist even if you change themes mid-session
        vim.api.nvim_set_hl(0, "SnacksExplorerFileIgnored", { link = "Normal" })
        vim.api.nvim_set_hl(0, "SnacksExplorerDirectoryIgnored", { link = "Directory" })
        vim.api.nvim_set_hl(0, "SnacksExplorerFileHidden", { link = "Normal" })
        vim.api.nvim_set_hl(0, "SnacksExplorerDirectoryHidden", { link = "Directory" })
      end,
    })
  end,
}
