return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, colors)
        -- Transparent background and different number coloring for current line
        hl.CursorLineNr = { fg = "#f4f4f4", bold = true }
        hl.CursorLine = { bg = "none" }
      end,
    },
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    name = "vscode",
    opts = {
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Enable italic inlay type hints
      italic_inlayhints = true,

      -- Underline `@markup.link.*` variants
      underline_links = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Apply theme colors to terminal
      terminal_colors = true,

      -- Override colors (see ./lua/vscode/colors.lua)
      group_overrides = {
        CursorLine = { bg = "none" },
        CursorLineNr = { fg = "#f4f4f4", bg = "none", bold = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
