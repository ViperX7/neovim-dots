local utils = require('utils')
local cmd = vim.cmd
local g=vim.g

-- onedark
g.onedark_hide_endofbuffer=1
g.onedark_terminal_italics=1
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme onedark'

-- Hide those ugly swiglies
    cmd 'highlight EndOfBuffer guifg=bg'
-- Italic comments
    cmd 'highlight Comment cterm=italic gui=italic'
-- Italic Keywords
    cmd 'highlight Keyword cterm=italic gui=italic'
-- Highlight overflow
    -- cmd 'highlight OverLength ctermbg=grey ctermfg=black guibg=#592929'
    -- cmd 'match OverLength /\\%81v.\\+/'


