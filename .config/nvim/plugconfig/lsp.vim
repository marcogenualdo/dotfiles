lua << EOF
local lspconfig = require'lspconfig'
capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'rust-tools'.setup{}

lspconfig.pyright.setup{capabilities = capabilities}

lspconfig.tsserver.setup{capabilities = capabilities}

lspconfig.graphql.setup{}

lspconfig.texlab.setup{
  capabilities = capabilities,
  cmd = { "texlab" },
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

_G.ts_organize_imports = function()
  -- check typescript client is attached
  local active_clients = {}
  for k, v in pairs(vim.lsp.get_active_clients()) do
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
EOF

" Actions
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
xnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <silent> <leader>n <cmd>lua vim.lsp.buf.rename()<cr>

" Definitions
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>

" Diagnostics
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>sh <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

" Formatting
let g:neoformat_try_node_exe = 1
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_jsonc = ['prettier']


command TsOrganizeImports call v:lua.ts_organize_imports()

augroup fmt
  autocmd!
  autocmd BufWritePre *.{ts,js,tsx,jsx} TsOrganizeImports
  autocmd BufWritePre * Neoformat
augroup END
