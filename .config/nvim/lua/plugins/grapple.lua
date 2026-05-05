return {
  "cbochs/grapple.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    scope = "git",
  },
  keys = {
    -- 1. Easily add one file
    { "<leader>a", "<cmd>Grapple tag<cr>", desc = "Grapple: Tag File" },

    -- 2. Go to files 1 to 4
    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "File 1" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "File 2" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "File 3" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "File 4" },

    -- 3. The Snacks UI Bridge
    {
      "<leader>m",
      function()
        local tags = require("grapple").tags() or {}
        local items = {}

        for _, tag in ipairs(tags) do
          table.insert(items, {
            text = tag.path,
            file = tag.path,
            idx = tag.index,
          })
        end

        require("snacks").picker.pick({
          title = "Grapple Tags",
          items = items,
          format = "file",
          confirm = function(picker, item)
            picker:close()
            require("grapple").select({ index = item.idx })
          end,
          -- Native Snacks actions (like delete) can be added here
          actions = {
            delete = function(picker, item)
              require("grapple").untag({ path = item.file })
              picker:list():set(vim.tbl_filter(function(i)
                return i.file ~= item.file
              end, picker:items()))
            end,
          },
          win = {
            input = {
              keys = {
                ["<c-d>"] = { "delete", mode = { "n", "i" } },
              },
            },
          },
        })
      end,
      desc = "Snacks: Grapple Menu",
    },
  },
}
