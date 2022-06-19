-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')

-- local luasnip = require("luasnip")
-- luasnip.snippets = require("luasnip-snippets").load_snippets()
require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup({

  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        -- buffer = "[Buffer]",
        -- nvim_lsp = "[LSP]",
        -- luasnip = "[LuaSnip]",
        -- nvim_lua = "[Lua]",
        -- latex_symbols = "[Latex]",
        cmp_tabnine = "[Tabnine]",
        calc = "🖩",
        -- path = "[Path]",
        -- emoji = "[emoji]",
      })
    }),
  },
  --

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- If you want tab completion :'(
    --  First you have to just promise to read `:help ins-completion`.
    --
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'ultisnips' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
  },
    {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'calc' },
      -- { name = 'spell' },
      { name = 'emoji' },
      { name = 'nvim_lsp_document_symbol' },
      -- { name = 'cmp_tabnine' },
    })
})



-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
    -- { name = 'fuzzy_buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    -- { name = 'fuzzy_path', options = { fd_timeout_msec = 1500 } }
  }, {
    { name = 'cmdline' }
  })
})
