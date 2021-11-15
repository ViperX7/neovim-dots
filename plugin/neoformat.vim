augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END]]

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd ColorScheme * call onedark#extend_highlight("Function", { "cterm": "bold" })
