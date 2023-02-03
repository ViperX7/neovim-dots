-- Indentation

local g = vim.g


-- Indent character  try (¦, ┆, ┊, |, │, ⎸or ▏│)
g.indentLine_enabled = 1
g.indent_blankline_char = "▏"
-- g.indent_blankline_char_highlight_list = 1

-- cmd("hi IndentBlanklineChar guifg=#373b43")

g.indent_blankline_space_char_blankline = " "
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_strict_tabs = true
g.indent_blankline_debug = false

g.indent_blankline_filetype_exclude = {
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

}
g.indent_blankline_buftype_exclude = {
  "terminal",
}

g.indent_blankline_context_patterns = {
  "class",
  "function",
  "method",
  "^if",
  "while",
  "for",
  "with",
  "func_literal",
  "block",
  "try",
  "except",
  "argument_list",
  "object",
  "dictionary",
}


vim.opt.termguicolors = true

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  -- show_current_context_start = true,
}
