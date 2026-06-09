return {
  {
    "nvim-lualine/lualine.nvim",
    -- opts = {
    --   options = {
    --     theme = "powerline",
    --     globalstatus = true,
    --     component_separators = "",
    --     section_separators = { left = "", right = "" },
    --   },
    -- },
    opts = function(_, opts)
      opts.options.theme = "powerline"
      opts.options.globalstatus = true
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }

      table.insert(opts.sections.lualine_x, 1, {
        function()
          return "●"
        end,
        cond = function()
          return vim.bo.modified
        end,
        color = { fg = "#ff9e64" },
        padding = { left = 1, right = 1 },
      })
    end,
  },
}
