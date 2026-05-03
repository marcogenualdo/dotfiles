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
  },
}
