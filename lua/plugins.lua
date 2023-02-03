local fn = vim.fn

-- Auto install packer.nvim if not exists
local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer Isn't here")
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


---@diagnostic disable: undefined-global
return packer.startup(function(use)

  -- startup optimizations
  use { 'lewis6991/impatient.nvim' }

  ----------------------------------------------------------------------
  -- Package Management
  ---------------------------------------------------------------------
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  ----------------------------------------------------------------------
  -- Visual Enhancement
  ---------------------------------------------------------------------

  use {
    -- Color schemes --
    -- use { 'olimorris/onedarkpro.nvim' } -- removed because confiicts with others
    'sainnhe/gruvbox-material',
    'navarasu/onedark.nvim',
    'EdenEast/nightfox.nvim',
    'folke/tokyonight.nvim',
    'shaunsingh/moonlight.nvim',
    'marko-cerovac/material.nvim',
    'rmehri01/onenord.nvim',
    'NTBBloodbath/doom-one.nvim',
  }

  -- Essentials --
  use {
    -- UI stuff
    { 'nvim-lua/plenary.nvim' },
    { "MunifTanjim/nui.nvim" },
    -- Icons
    { 'kyazdani42/nvim-web-devicons' },
  }


  --  Better UI --
  -- use { "folke/noice.nvim", config = function() require("config.noice") end }

  -- Notifications --
  use { 'rcarriga/nvim-notify', config = function() vim.notify = require("notify") require("notify").setup() end }

  -- LSP status indicator
  use { 'j-hui/fidget.nvim', config = function() require("fidget").setup() end }

  -- status line
  -- use { 'nvim-lualine/lualine.nvim', config = function() require("config.lualine") end }
  use { 'glepnir/galaxyline.nvim', branch = 'main',
    config = function() require("config.galaxyline") end }

  -- Tab line
  use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function() require("config.bufferline") end }


  ----------------------------------------------------------------------
  -- Editor Enhancements
  ---------------------------------------------------------------------


  -- Welcome Dashoard
  use { 'goolord/alpha-nvim',
    config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end
  }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim',
    config = function() require("config.telescope") end,
    requires = {
      -- -- Preview extension
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    }
  }



  -- Sidebar File explorer --
  use { 'kyazdani42/nvim-tree.lua', config = function() require("config.nvim-tree") end }
  -- File Manager
  use { 'kevinhwang91/rnvimr' }

  -- Shortcut helper popup --
  use { 'folke/which-key.nvim', config = function() require("config.which-key") end }

  -- Terminal --
  use { "akinsho/toggleterm.nvim", tag = '*', config = function() require("config.floatterm") end }

  -- Tagbar
  use { "simrat39/symbols-outline.nvim", config = function() require("config.outline") end }

  -- Git related stuff
  use {
    { 'lewis6991/gitsigns.nvim', config = function() require("config.gitsign") end }, -- git gigns in signcolumn
    { 'TimUntersberger/neogit', config = function() require("config.neogit") end }, -- git manager
    { "sindrets/diffview.nvim" }, -- diff helper
  }


  -- Editor config support --
  use 'gpanders/editorconfig.nvim'

  -- Buffer Management --
  use 'famiu/bufdelete.nvim'



  ----------------------------------------------------------------------
  -- Language Servers
  ---------------------------------------------------------------------
  use { -- Lsp Manager --
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },

    -- LSP config providers
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig", config = function() local lspconfig = require("lspconfig") end },

    -- Formatting
    { 'jose-elias-alvarez/null-ls.nvim', config = function() require("config.nullls") end },
  }

  use { -- LSP Utils --
    -- Diagnostic colors for lsp
    { 'folke/lsp-colors.nvim' },

    -- Project diagnostics with LSP
    { "folke/trouble.nvim", },

    -- Lsp utilities
    { 'tami5/lspsaga.nvim', config = function() require("config.lspsaga") end },

    -- goto preview live
    { 'rmagatti/goto-preview', config = function() require("config.goto_preview") end },
  }





  -- use { 'tzachar/cmp-tabnine', run = './install.sh' }


  -- Annotations and documentation
  use { "danymat/neogen", config = function() require('config.neogen') end }

  use { -- Treesetter --
    { 'nvim-treesitter/nvim-treesitter', config = function() require("config.treesetter") end },
    { 'windwp/nvim-ts-autotag', ft = { "html", "markdown", "xml" } },
  }


  use { -- Comment --
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },

    event = 'BufEnter'
  }

  use { -- Parenthesis --
    -- Auto pairying helpers
    { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },
    -- Highlight pairs
    { 'andymass/vim-matchup' },
    -- Rainbow paren
    { 'p00f/nvim-ts-rainbow' },

    event = 'BufEnter'
  }

  use { -- Feature Group --
    -- Automatic line number toggle
    { 'jeffkreeftmeijer/vim-numbertoggle' },
    -- Mautiple cursors
    { 'mg979/vim-visual-multi' },
    -- Indentation
    { "lukas-reineke/indent-blankline.nvim",
      config = function() require("config.blankline-indent") end
    },
    -- Colors
    { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end },



    event = 'BufEnter'
  }



  -- Commenting
  -- use {'tomtom/tcomment_vim'}
  --


  -- Fast movement
  -- use {'easymotion/vim-easymotion'}
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use { 'tpope/vim-repeat' }

  -- Scrolling
  use { 'karb94/neoscroll.nvim', config = function() require("config.neoscrool") end }

  ---------------------------------------------------------------------
  -- Code Actions --
  ---------------------------------------------------------------------
  use {
    -- Completions --
    { 'hrsh7th/nvim-cmp', config = function() require("config.nvim-cmp") end },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'f3fora/cmp-spell' },
    { 'hrsh7th/cmp-emoji' },
    { 'andersevenrud/cmp-tmux' },

    { 'romgrk/fzy-lua-native', run = 'make' },
    { 'tzachar/cmp-fuzzy-buffer', requires = { 'tzachar/fuzzy.nvim' } },
    { 'tzachar/cmp-fuzzy-path', requires = { 'tzachar/fuzzy.nvim' } },

    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },

    -- Add symbols to completion menu
    { 'onsails/lspkind-nvim', config = function() require("config.lspkind") end },
  }


  use {
    -- Snippets --
    -- use {'hrsh7th/vim-vsnip'},
    -- use 'hrsh7th/vim-vsnip-integ',
    { 'SirVer/ultisnips', config = function() require("config.ultisnips") end },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- use {'honza/vim-snippets'},
    { 'norcalli/snippets.nvim' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'molleweide/LuaSnip-snippets.nvim' },
    { 'rafamadriz/friendly-snippets' },

  }



  -- Timing plugin
  use "dstein64/vim-startuptime"

  -- Session Management
  -- use 'tpope/vim-obsession'
  -- ************************* Documentatoin *********************************
  -- vim wiki
  -- use {'vimwiki/vimwiki'} -- A personal wiki for vim

  -----------------------------------------------------------------------
  ----- Integration
  -----------------------------------------------------------------------
  -- TMUX navigation
  use { 'christoomey/vim-tmux-navigator' }

  -----------------------------------------------------
  -- Language Specific
  -----------------------------------------------------

  -- Lua
  use {
    { 'tjdevries/nlua.nvim' },
    { 'euclidianAce/BetterLua.vim' }, --  better Lua syntax highlighting
    { 'tjdevries/manillua.nvim' }, -- fancy lua folds, you can check this out.
    ft = "lua",
  }

  -- Flutter
  use {
    { 'dart-lang/dart-vim-plugin', ft = "dart" },
    { 'akinsho/flutter-tools.nvim', ft = "dart", config = function() require("config.fluttertools") end },
    { 'Neevash/awesome-flutter-snippets', ft = "dart" },
  }


  -- Markdown
  use { 'suan/vim-instant-markdown', ft = "markdown" }

  use { 'jubnzv/mdeval.nvim',
    config = function()
      require("config.mdeval")
    end, ft = { "markdown", "norg" },
  }
  -- orgmode
  use { "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require("config.neorg")
    end,
    ft = "norg", cmd = "Neorg" }
  use { 'ViperX7/nvim-FeMaco.lua', config = function() require("femaco").setup() end, ft = { "markdown", "neorg" } }
  use { "folke/zen-mode.nvim",
    config = function()
      require("config.zenmode")
    end }

  use { 'jdhao/better-escape.vim', event = 'InsertEnter', config = function()
    vim.g.better_escape_shortcut = { "jk", "kj" }
    vim.g.better_escape_interval = 50
  end }

  -- Code runner
  use { 'michaelb/sniprun', run = 'bash ./install.sh' }
  use { 'CRAG666/code_runner.nvim', config = function()
    require("config.code_runner")
  end }

  -- smali reversing
  use { "mzlogin/vim-smali", ft = "smali" }
  -- python
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins', config = function()
    require("config.magma")
  end }


  -- Vim dispatch
  -- use {'tpope/vim-dispatch'}



  if packer_bootstrap then
    require('packer').sync()
  end

end)
