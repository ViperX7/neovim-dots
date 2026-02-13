-- vim.cmd [[packadd nvim-lspconfig]]
-- vim.cmd [[packadd nvim-compe]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end


-- Configure pyrefly separately with settings
vim.lsp.config.pyrefly = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = "force-on",
      },
    },
  },
}
-- vim.lsp.enable("pyrefly")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'ccls', "cssls", "html", "denols", "hls", "lua_ls", "rust_analyzer", "yamlls", "ansiblels",
  -- "ty",
  -- "pyrefly",
  "ruff",
  "basedpyright",
  -- "harper_ls",
  -- "ruff_lsp",
  -- "pylyzer",
  -- "pylsp"
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    on_attach = on_attach,
    capabilities = capabilities,
    -- flags = { debounce_text_changes = 150 }
  }
  vim.lsp.enable(lsp)
end

local pid = vim.fn.getpid()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,

  }
)

vim.diagnostic.config({
  virtual_text = true,
})
