let mapleader=" "


"""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'
Plug 'editorconfig/editorconfig-vim' " file-type specific settings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dohsimpson/vim-macroeditor' " usage: MacroEdit <register-letter>

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

" Look
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

call plug#end()


" !on installation run %s/#1E1E1E/#111111/g in colors.vim
colorscheme codedark


"""""""""""""""""""""""""""""""""
" BASICS

syntax on "syntax highlighting
set nocompatible  "Set compatibility to Vim only.
set encoding=utf-8
set termguicolors
set noswapfile
set smartindent
set incsearch
set mouse+=a

" Use system clipboard
set clipboard+=unnamedplus

" Automatically wrap text that extends beyond the screen length.
set wrap

" Show relative line numbers
highlight LineNr ctermfg=grey
set ruler
set number relativenumber

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling
set ttyfast

" Commands options
set showmode
set showcmd

set wildmenu
set wildignore+=**/node_modules/**

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" j/k will move virtual lines (lines that wrap)
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" copy till the end of the line
nnoremap Y y$


"""""""""""""""""""""""""""""""""
" NAVIGATION

" Sane splits
set splitright
set splitbelow

" better window splits
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" next/previous tab
nnoremap <silent> <leader>m :tabn<CR>
nnoremap <silent> <leader>n :tabp<CR>

" cycle through buffers
nnoremap <silent> <leader>b :bn<cr>
" go to last opened buffer
nnoremap <leader><leader> <C-^>

" resizing panes
nmap <leader>L :vertical resize +10<CR>
nmap <leader>H :vertical resize -10<CR>
nmap <leader>J :resize +5<CR>
nmap <leader>K :resize -5<CR>


"""""""""""""""""""""""""""""""""
" SEARCH

" case sensitive search only when a capital letter is in the search pattern
set ignorecase
set smartcase

" search with f
nmap <leader>f /

" unhighlight, think 'deselect'
nmap <leader>d :noh<cr>

" Indentation
set smarttab
set cindent
"set tabstop=2
"set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab


"""""""""""""""""""""""""""""""""
" FZF

nnoremap <leader>o :Files<CR>
nnoremap <leader>r :Rg<CR>


"""""""""""""""""""""""""""""""""
" EASY ALIGN

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""
" COC

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-explorer',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-vimtex',
  \ ]

set hidden
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" nerdtree toggle
nmap <silent> <C-n> :CocCommand explorer --width 32<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
nnoremap <leader><F2> :CocSearch <C-R>=expand("<cword>")<CR><CR>
