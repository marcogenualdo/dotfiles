let mapleader=" "


"""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/tmux-complete.vim'
Plug 'editorconfig/editorconfig-vim' " file-type specific settings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'dohsimpson/vim-macroeditor' " usage: MacroEdit <register-letter>
Plug 'junegunn/goyo.vim'

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'jparise/vim-graphql'

" Look
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

call plug#end()


" !on installation run %s/#1E1E1E/#111111/g in colors.vim
colorscheme codedark


"""""""""""""""""""""""""""""""""
" DEPENDENCIES

let g:python3_host_prog = '/home/mgenualdo/.asdf/installs/python/3.9.0/bin/python'
" let g:loaded_python3_provider = 0


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
set modeline

" Use system clipboard
set clipboard+=unnamedplus

" Automatically wrap text that extends beyond the screen length.
set wrap

" Show relative line numbers
highlight LineNr ctermfg=grey
set ruler
set number relativenumber

" let lightline show the mode
set noshowmode

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling
set ttyfast

" Commands options
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

" unhighlight, think 'deSelect'
nmap <leader>d :noh<cr>

" Indentation
set smarttab
set cindent
"set tabstop=2
"set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab


"""""""""""""""""""""""""""""""""
" PAGER SETTINGS

let $PAGER=''


"""""""""""""""""""""""""""""""""
" COMMANDS

nnoremap zc :q<CR>
nnoremap zz :qa<CR>
command Todo :e ~/todo.md

" create a tmux session bound to this folder
command TmuxPair execute "!bash ~/.config/nvim/pop-terminal.sh > /dev/null 2>&1"
nnoremap <silent> <leader>t :TmuxPair<CR><CR>

" delete for good, without copying to clipboard
nnoremap <leader>D "_d
vnoremap <leader>D "_d

" auto-create xml tags
inoremap <buffer> <C-c> <esc>yiwi<lt><esc>ea></><esc>hpF>a


"""""""""""""""""""""""""""""""""
" LIGHTLINE

let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
	\ },
	\ }


"""""""""""""""""""""""""""""""""
" FZF

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>f /
nnoremap <leader>o :Files<CR>
nnoremap <leader>r :RG<CR>
nnoremap <leader>s :History/<CR>

" VIM ROOTER
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git', 'Makefile', 'package.json', 'pyproject.toml']


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
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-vimtex',
  \ 'coc-css',
  \ 'coc-svg',
  \ 'coc-graphql',
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
nmap <silent> <leader>e :CocCommand explorer<CR>

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
vnoremap <leader><F2> :CocSearch '<,'><CR><CR>

" Auto format imports
nmap <leader>i :CocCommand tsserver.organizeImports<cr>

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
