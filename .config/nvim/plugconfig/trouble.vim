lua << EOF
require("trouble").setup {}
EOF

nnoremap <leader>q <cmd>Trouble quickfix<cr>
nnoremap <silent> gr <cmd>Trouble lsp_references<cr>
