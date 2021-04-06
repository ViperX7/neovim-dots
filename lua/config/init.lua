require('config.colorscheme')

-- Git
require('config.fugitive')
require('config.gitsign')

-- Visual
require('config.dashbord-nvim')

-- Tools
require('config.telescope')
require('config.nvim-tree')
require('config.treesetter')

-- Bars
require('config.galaxyline')
require('config.bufferline')

-- Completion
require('config.lspkind')
require('config.nvim-compe')
require('config.fluttertools')
require('config.lightbulb')
-- require('config.lspsaga')
require('config.ultisnips')

-- Movement
require('config.easymotion')

require('config.neoscrool')

require'colorizer'.setup()

-- Lang specific
vim.g.dart_format_on_save = 1
