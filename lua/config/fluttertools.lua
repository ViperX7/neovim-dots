-- require("flutter-tools").setup{} -- use defaults
-- alternatively you can override the default configs
require("flutter-tools").setup {
  experimental = { -- map of feature flags
    lsp_derive_paths = true, -- experimental: Attempt to find the user's flutter SDK
  },
  debugger = { -- experimental: integrate with nvim dap
    enabled = false,
  },
  flutter_path = "/opt/flutter/bin/flutter", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  widget_guides = {
    enabled = true,
    debug = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = ">"
  },
  dev_log = {
    open_cmd = "tabedit",
  },
  outline = {
    open_cmd = "30vnew",
  },
  lsp = {
    -- on_attach = my_custom_on_attach,
    -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
    settings = {
      showTodos = true,
      completeFunctionCalls = true -- NOTE: this is WIP and doesn't work currently
    }
  }
}
