local NS = { noremap = true, silent = true }

return {
  {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = true,
    init = function()
      vim.keymap.set("x", "ga", function()
        require("align").align_to_char({
          length = 1,
        })
      end, NS)
    end,
  },
}
