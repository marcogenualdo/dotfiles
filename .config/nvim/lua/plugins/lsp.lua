return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              -- Let conform.nvim handle formatting via yamlfmt instead. The
              -- yaml-language-server formatter is Prettier-based and always
              -- indents lists / collapses blank lines, which is too aggressive.
              format = {
                enable = false,
              },
              -- Standard SchemaStore additions if you use them
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
            },
          },
        },
      },
    },
  },
}
