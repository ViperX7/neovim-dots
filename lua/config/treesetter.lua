require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {  }, -- List of parsers to ignore installing
  indent = {
    enable = true
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
}



