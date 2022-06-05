require('config.colorscheme')

-- Git
require('config.fugitive')
require('config.gitsign')

-- Visual
require('config.dashbord-nvim')
require('config.blankline-indent')

-- Tools
require('config.telescope')
require('config.nvim-tree')
require('config.treesetter')
require('config.which-key')

-- Bars
require('config.galaxyline')
require('config.bufferline')

-- Completion
require('config.lspkind')
require('config.nvim-compe')
require('config.fluttertools')
-- require('config.lightbulb')
require('config.lspsaga')
require('config.ultisnips')
-- require('config.trouble')
-- require('config.lsp-colors')

-- Functionality
require('config.context-comment')

-- Movement

require('config.neoscrool')

require'colorizer'.setup()

-- Lang specific
vim.g.dart_format_on_save = 1
require('config.mdeval')
require('config.neorg')
require('config.zenmode')
