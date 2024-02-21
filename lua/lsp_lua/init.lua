-- vim.cmd [[packadd nvim-lspconfig]]
-- vim.cmd [[packadd nvim-compe]]

local nvim_lsp = require("lspconfig")

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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "bashls", 'ccls', "cssls", "html", "denols", "hls", "lua_ls", "rust_analyzer", "yamlls", "ansiblels",
  "pyright","marksman"
  -- "ruff_lsp",
  -- "pylyzer",
  -- "pylsp"
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 }
  }
end

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/utkarsh/.dotnet/Omnisharp/OmniSharp"
require 'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  capabilities = capabilities,
}

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false
--     }
-- )
