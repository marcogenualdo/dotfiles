" Actions
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
xnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <silent> <leader>n <cmd>lua vim.lsp.buf.rename()<cr>

" Definitions
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>

" Diagnostics
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
inoremap <silent> <C-k> <cmd>lua vim.lsp.buf.hover()<cr>
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
