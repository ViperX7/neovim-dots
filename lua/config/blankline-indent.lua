-- blankline

local g = vim.g


local indent = 2
-- Indent character  try (¦, ┆, ┊, |, │, ⎸or ▏)
g.indentLine_enabled = 1
g.indent_blankline_char = "▏"
-- g.indent_blankline_char_highlight_list = 1

cmd("hi IndentBlanklineChar guifg=#373b43")

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal","dashboard"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
