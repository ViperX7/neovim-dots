-- Indentation

-- local g = vim.g
--
--
-- -- Indent character  try (¦, ┆, ┊, |, │, ⎸or ▏│)
-- g.indentLine_enabled = 1
-- g.indent_blankline_char = "▏"
-- -- g.indent_blankline_char_highlight_list = 1
--
-- -- cmd("hi IndentBlanklineChar guifg=#373b43")
--
-- g.indent_blankline_space_char_blankline = " "
-- g.indent_blankline_show_trailing_blankline_indent = false
-- g.indent_blankline_show_first_indent_level = false
-- g.indent_blankline_strict_tabs = true
-- g.indent_blankline_debug = false
--
--
--
-- g.indent_blankline_context_patterns = {
--   "class",
--   "function",
--   "method",
--   "^if",
--   "while",
--   "for",
--   "with",
--   "func_literal",
--   "block",
--   "try",
--   "except",
--   "argument_list",
--   "object",
--   "dictionary",
-- }


vim.opt.termguicolors = true







require("ibl").setup {
  -- -- U+2502 may also be a good choice, it will be on the middle of cursor.
  -- -- U+250A is also a good choice
  -- Indent character  try (¦, ┆, ┊, |, │, ⎸or ▏│)
  indent = {
    char = "▏",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    injected_languages = false,
    -- highlight = { "Function", "Label" },
    priority = 500,
  },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "defx",
      "vimwiki",
      "md",
      "man",
      "gitmessengerpopup",
      "diagnosticpopup",
      "NVIMTREE",
      "dashboard",
      "Trouble",
      "packer",
      "NeogitStatus",
      "mason",
      "Notification",
      "notification",
      "fidget",
      "Fidget",
    }
    ,
    buftypes = { "terminal" },
  },
}
