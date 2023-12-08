-- Loading modules
require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'

-- Language servers configs
local common_configs = { capabilities = capabilities }

local server_configs = {
  -- lua_ls = {},

  pyright = {},

  tsserver = {},

  graphql = {},

  terraformls = {},

  texlab = {
    filetypes = { 'tex', 'bib' },
    settings = {
      texlab = {
        auxDirectory = '.',
        bibtexFormatter = 'texlab',
        build = {
          args = { '--synctex', '--keep-logs', '--keep-intermediates' },
          executable = 'tectonic',
          forwardSearchAfter = false,
          onSave = false,
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false,
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {},
        },
        latexFormatter = 'latexindent',
        latexindent = {
          modifyLineBreaks = false,
        },
      },
    },
  },
}

-- Loading configs
for name, maybe_config in pairs(server_configs) do
  local custom_configs = maybe_config or {}
  local config = vim.tbl_deep_extend('force', common_configs, custom_configs)

  lspconfig[name].setup(config)
end

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
      command = '_typescript.organizeImports',
      arguments = { vim.api.nvim_buf_get_name(bufnr) },
    }

    vim.lsp.buf_request_sync(bufnr, 'workspace/executeCommand', params, 500)
  end
end

vim.cmd [[runtime ./lsp.vim]]
