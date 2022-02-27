set completeopt=menu,noselect

lua << EOF
local cmp = require'cmp'
local luasnip = require'luasnip'

local tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end

local s_tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

cmp.setup{
  snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      -- do not auto-complete first item if no menu entry was selected
      select = false,
    }),
    ['<Tab>'] = tab_complete,
    ['<S-Tab>'] = s_tab_complete,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  }
}

-- load snippet libraries
require('luasnip.loaders.from_vscode').load()
EOF

