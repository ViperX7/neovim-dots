local utils = require('utils')

local cmd = vim.cmd
local indent = 4

utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- Highlight on yank
-- vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- *****************************Editor Visual Elements*************************

-- Syntax Highlighting
    cmd 'syntax enable'
    utils.opt('o', 'background', 'dark') -- tell vim what the background color looks like
    utils.opt('o', 'termguicolors', true) -- Use all colors

-- Line Numbering
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

-- Highlight current line
  utils.opt('o', 'cursorline',true)
-- Highlight matching [{()}]
  utils.opt('o', 'showmatch',true)


-- Characters per line limit
  -- That verticle line
    cmd 'set colorcolumn=80'
-- Highlight overflow
    cmd 'highlight OverLength ctermbg=grey ctermfg=black guibg=#592929'
    cmd 'match OverLength /\\%81v.\\+/'


-- Display different types of white spaces.
  utils.opt('o', 'list',true)
  cmd 'set listchars=tab:›\\ ,trail:•,extends:#,nbsp:.'


-- Open new split panes to right and bottom, which feels more natural
  utils.opt('o', 'splitbelow',true)
  utils.opt('o', 'splitright',true)


-- Display options
  utils.opt('o', 'showmode',true)
  -- Show command in bottom bar
    utils.opt('o', 'showcmd',true)


-- Status bar
      utils.opt('o', 'laststatus',2)

-----------------------------------------------------------------------------




--********************************Functionality******************************



-- Indentation
    cmd 'filetype plugin indent on' -- load filetype-specific indent files
	cmd 'set nowrap'
    cmd 'smartindent'
    cmd 'autoindent'
    cmd 'copyindent'    -- copy the previous indentation on autoindenting

    -- Spaces and Tabs
        local indent = 4
        utils.opt('b', 'tabstop', indent)       -- number of visual spaces per TAB fixed tab length
        cmd 'set softtabstop=4'   -- number of spaces in tab when editing

        utils.opt('b', 'expandtab', true)  -- tabs are spaces


utils.opt('b', 'shiftwidth', indent)
          utils.opt('o', 'smarttab',true)      -- insert tabs on the start of a line according to
                          -- shiftwidth, not tabstop

-- Searching
  utils.opt('o', 'smartcase',true)      -- ignore case  search pattern is all lowercase, case-sensitive otherwise
  utils.opt('o', 'hlsearch',true)       -- Highlight all matches
  utils.opt('o', 'ignorecase',true)     -- ignore case when searching



-- Code Folding
  utils.opt('o', 'foldenable',true)       -- enable folding
    cmd 'set foldlevelstart=10'           -- open folds less than 10 lines
    cmd 'set foldnestmax=10'              -- 10 nested fold max
    -- fold based on indent level
        cmd 'set foldmethod=indent'       -- accepted: marker, manual, expr, syntax, diff, indent



-- Visual autocomplete for command menu
  utils.opt('o', 'wildmenu',true)

-- Mouse
    -- Display 5 lines above/below the cursor when scrolling with a mouse.
        cmd 'set scrolloff=5'
    -- Speed up scrolling in Vim
        cmd 'set ttyfast'
    -- Enable Mouse
        cmd 'set mouse=a'

-- Autocomplete with dictionary words when spell check is on
    cmd 'set complete+=kspell'

    cmd 'set iskeyword+=-'          -- treat dash separated words as a word text object"
    cmd 'set conceallevel=0'        -- So that I can see `` in markdown files
    cmd 'set clipboard=unnamedplus' -- Copy paste between vim and everything else
--  **************************************************************************
