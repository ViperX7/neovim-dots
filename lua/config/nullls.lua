local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  -- formatting
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.formatting.mdformat,
  -- null_ls.builtins.diagnostics.mdl,

  -- diagnostics
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.alex,
  null_ls.builtins.diagnostics.proselint,
  null_ls.builtins.diagnostics.checkmake,
  null_ls.builtins.diagnostics.chktex,
  null_ls.builtins.diagnostics.codespell,
  null_ls.builtins.diagnostics.ansiblelint,

  null_ls.builtins.diagnostics.write_good.with({
    extra_filetypes = { "norg" },
  }),

  null_ls.builtins.diagnostics.cspell.with({
    filetypes = { "norg", "markdown" },
  }),

  null_ls.builtins.diagnostics.cppcheck,
  null_ls.builtins.diagnostics.deadnix,
  null_ls.builtins.diagnostics.shellcheck,
  -- null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.reorder_python_imports,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.codespell,
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.csharpier,
  -- null_ls.builtins.formatting.stylua,
  -- null_ls.builtins.diagnostics.gccdiag,
  -- null_ls.builtins.diagnostics.gdblint,
  null_ls.builtins.diagnostics.gitlint,
  -- null_ls.builtins.diagnostics.hadolint,
  -- null_ls.builtins.diagnostics.jsonlint,
  -- null_ls.builtins.diagnostics.luacheck,
  -- null_ls.builtins.diagnostics.selene,
  -- null_ls.builtins.diagnostics.misspell,
  -- null_ls.builtins.diagnostics.misspell,
  -- null_ls.builtins.diagnostics.mypy,
  -- null_ls.builtins.diagnostics.pydocstyle,
  -- null_ls.builtins.diagnostics.pylama,
  null_ls.builtins.diagnostics.pylint,
  -- null_ls.builtins.diagnostics.pyproject_flake8,
  -- null_ls.builtins.diagnostics.semgrep,
  -- null_ls.builtins.diagnostics.uncrustify,

  -- codeaction
  null_ls.builtins.code_actions.cspell,
  null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.code_actions.proselint,
  null_ls.builtins.code_actions.refactoring,
  -- null_ls.builtins.code_actions.gitsigns,
  -- completion
  null_ls.builtins.completion.spell,

}

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
})
