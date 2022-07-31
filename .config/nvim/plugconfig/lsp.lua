local lspinstaller = require'nvim-lsp-installer'
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'rust-tools'.setup{}

local common_configs = { capabilities = capabilities }

local server_configs = {
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
      }
    }
  },

  pyright = {},

  tsserver = {},

  graphql = {},

  terraform_lsp = {},

  texlab = {
    filetypes = { "tex", "bib" },
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "--synctex", "--keep-logs", "--keep-intermediates" },
          executable = "tectonic",
          forwardSearchAfter = false,
          onSave = false
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    }
  }
}

lspinstaller.on_server_ready(function(server)
  local custom_configs = server_configs[server.name] or {}
  local config = vim.tbl_deep_extend('force', common_configs, custom_configs)

  server:setup(config)
end)

_G.ts_organize_imports = function()
  -- check typescript client is attached
  local active_clients = {}
  for _, v in pairs(vim.lsp.get_active_clients()) do
    active_clients[v.name] = true
  end

  if active_clients['tsserver'] then
    -- execute organize imports
    local bufnr = vim.api.nvim_get_current_buf()

    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(bufnr) },
    }

    vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
  end
end
