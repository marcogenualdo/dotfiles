lua << EOF
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,

    mappings = {
      i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-f>"] = actions.send_selected_to_qflist,
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter    = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>f <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>r <cmd>Telescope live_grep<cr>
nnoremap <leader>c <cmd>Telescope command_history<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
