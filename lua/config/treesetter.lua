
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all" (parsers with maintainers), or a list of languages
  ignore_install = {  }, -- List of parsers to ignore installing
  autotag = {
    enable = true
  },
  indent = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  --   max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- }
}




