-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require("luasnip")

-- local luasnip = require("luasnip")
-- luasnip.snippets = require("luasnip-snippets").load_snippets()
require("luasnip.loaders.from_vscode").lazy_load()


-- Detect if words are before cursor position.
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({

  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  formatting = {
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      item = require("lspkind").cmp_format({
        mode = "symbol_text",
        menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          vsnip = "[vsnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
          codeium = "[Codeium]",
          symbol_map = { Codeium = "", },
          neorg = "[Neorg]",
          -- cmp_tabnine = "[Tabnine]",
          calc = "🖩",
          path = "[Path]",
          emoji = "[emoji]",
          tmux = "[TMUX]",
        })
        -- any lspkind format settings here
      })(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end
  },
  --
  --

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- If you want tab completion :'(
    --  First you have to just promise to read `:help ins-completion`.
    --
    --
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.g.codeium_enabled == 1 and " 0 " ~= vim.fn['codeium#GetStatusString']() then
        -- vim.notify("cmp")
        -- vim.notify("*"..vim.fn['codeium#Accept']() .. "*")
        vim.api.nvim_input("<C-x>")
        -- vim.notify("cmpdone")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expandable()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  sources = cmp.config.sources({
      { name = 'codeium' },
      { name = 'luasnip' },
      { name = 'ultisnips' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      { name = 'cmp_tabnine' },
    },
    {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'calc' },
      { name = 'spell' },
      { name = 'emoji' },
      { name = 'nvim_lsp_document_symbol' },
      { name = 'tmux' },
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
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' },
--     -- { name = 'fuzzy_path', options = { fd_timeout_msec = 1500 } }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
