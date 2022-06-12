require("config.colorscheme")

-- Git
require("config.fugitive")
require("config.gitsign")

-- Visual
require("config.dashbord-nvim")
require("config.blankline-indent")
require("config.alpha")

-- Tools
require("config.telescope")
require("config.nvim-tree")
require("config.treesetter")
require("config.which-key")
require("config.floatterm")
require("config.neogit")

-- Bars
require("config.galaxyline")
require("config.bufferline")

-- Completion
require("config.lspkind")
require("config.nullls")
-- require('config.nvim-compe')
require("config.nvim-cmp")
-- require('config.tabnine')
require("config.fluttertools")
-- require('config.lightbulb')
require("config.lspsaga")
require("config.ultisnips")
require("config.code_runner")
-- require('config.trouble')
-- require('config.lsp-colors')

-- Movement

require("config.neoscrool")

require("colorizer").setup()
require("fidget").setup()

-- Lang specific
vim.g.dart_format_on_save = 1
require("config.mdeval")
require("config.neorg")
require("config.zenmode")
