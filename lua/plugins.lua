local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
---@diagnostic disable: undefined-global
return packer.startup(function()


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
  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use 'navarasu/onedark.nvim'
  use 'olimorris/onedarkpro.nvim'
  use { 'EdenEast/nightfox.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'shaunsingh/moonlight.nvim' }
  use { 'marko-cerovac/material.nvim' }
  use { 'rmehri01/onenord.nvim' }

  --
  -- use { 'goolord/alpha-nvim'}

  -- Indentation
  use { "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.blankline-indent")
    end
  }

  ----------------------------------------------------------------------
  -- Editor Enhancements
  ---------------------------------------------------------------------
  -- Fuzzy finder
  use { 'nvim-lua/plenary.nvim' }
  use { 'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
      require("notify").setup()
    end }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim',
    config = function()
      require("config.telescope")
    end }
  -- Preview extension
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  -- use 'nvim-telescope/telescope-fzy-native.nvim'
  --
  use {
    'rmagatti/goto-preview',
    config = function()
      require("config.goto_preview")
    end
  }

  use 'gpanders/editorconfig.nvim'

  use { 'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup()
    end }

  -- Shortcut helper popup
  use { 'folke/which-key.nvim', config = function()
    require("config.which-key")
  end }

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua',
    config = function()
      require("config.nvim-tree")
    end
  }

  -- File Managers
  use 'kevinhwang91/rnvimr'

  -- Vim dispatch
  -- use {'tpope/vim-dispatch'}

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = 'v1.*',
    config = function()

      require("config.floatterm")
    end }

  -- Git related stuff
  -- use { 'tpope/vim-fugitive' } -- removed in favour of neogit
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require("config.gitsign")
    end }
  use { 'TimUntersberger/neogit',
    config = function()
      require("config.neogit")
    end }
  use { "sindrets/diffview.nvim" }

  -- Anotations and documentation
  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("config.lualine")
    end
  }
  -- use {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   config = function()
  --     require("config.galaxyline")
  --   end
  -- }

  -- Tab line
  use { 'akinsho/bufferline.nvim', tag = "v2.*", config = function()
    require("config.bufferline")
  end }
  use 'famiu/bufdelete.nvim'

  -- treesetter
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require("config.treesetter")
    end }
  use { 'windwp/nvim-ts-autotag' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  -- Automatic line number toggle
  use { 'jeffkreeftmeijer/vim-numbertoggle' }

  -- Mautiple cursors
  use { 'mg979/vim-visual-multi' }

  -- Auto pairying helpers
  use { 'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }


  use { 'tpope/vim-surround' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'andymass/vim-matchup', event = 'VimEnter' }


  -- Welcome Dashoard
  -- use {'glepnir/dashboard-nvim'}

  -- Commenting
  -- use {'tomtom/tcomment_vim'}
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Colors
  use { "norcalli/nvim-colorizer.lua", config = function()
    require("colorizer").setup()
  end
  }

  -- Tagbar
  -- use { 'majutsushi/tagbar' }  -- removed in favour of symboloutlinee
  use 'simrat39/symbols-outline.nvim'

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
  use { 'karb94/neoscroll.nvim', config = function()
    require("config.neoscrool")
  end }

  -- Snippets
  -- use {'hrsh7th/vim-vsnip'}
  -- use 'hrsh7th/vim-vsnip-integ'
  use { 'SirVer/ultisnips', config = function()

    require("config.ultisnips")
  end }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  -- use {'honza/vim-snippets'}
  use('norcalli/snippets.nvim')

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'molleweide/LuaSnip-snippets.nvim'
  use { 'rafamadriz/friendly-snippets' }


  use { 'hrsh7th/nvim-cmp',
    config = function()
      require("config.nvim-cmp")
    end
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'f3fora/cmp-spell'
  use 'hrsh7th/cmp-emoji'

  use { 'romgrk/fzy-lua-native', run = 'make' }
  -- use { 'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }
  -- use { 'tzachar/cmp-fuzzy-path', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }

  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'


  -- Timing plugin
  use "dstein64/vim-startuptime"

  -- Session Management
  use 'tpope/vim-obsession'
  -- ************************* Documentatoin *********************************
  -- vim wiki
  -- use {'vimwiki/vimwiki'} -- A personal wiki for vim

  ----------------------------------------------------------------------
  -- Language Servers
  ---------------------------------------------------------------------
  -- LSP and completion
  use {
    {
      "williamboman/nvim-lsp-installer",
      config = function()
        require("nvim-lsp-installer").setup {}
      end
    },
    {
      "neovim/nvim-lspconfig",
      after = "nvim-lsp-installer",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.sumneko_lua.setup {}
      end
    }
  }

  -- Formating
  use { 'jose-elias-alvarez/null-ls.nvim', config = function()

    require("config.nullls")
  end }

  -- use {'kosayoda/nvim-lightbulb'}      -- Removed because lspsaga does better
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use 'folke/lsp-colors.nvim'

  use { 'tami5/lspsaga.nvim',
    config = function()
      require("config.lspsaga")
    end }

  -- use { 'tzachar/cmp-tabnine', run = './install.sh' }

  -- Add symbols to completion menu
  use { 'onsails/lspkind-nvim',
    config = function()
      require("config.lspkind")
    end }

  -----------------------------------------------------------------------
  ----- Integration
  -----------------------------------------------------------------------
  -- TMUX navigation
  use { 'christoomey/vim-tmux-navigator' }

  -----------------------------------------------------
  -- Language Specific
  -----------------------------------------------------

  -- Lua
  use { 'tjdevries/nlua.nvim', ft = "lua" }
  use { 'euclidianAce/BetterLua.vim', ft = "lua" } --  better Lua syntax highlighting
  use { 'tjdevries/manillua.nvim', ft = "lua" } -- fancy lua folds, you can check this out.

  -- Flutter
  -- use {'thosakwe/vim-flutter'}
  use { 'dart-lang/dart-vim-plugin', ft = "dart" }
  use { 'akinsho/flutter-tools.nvim', ft = "dart", config = function()
    require("config.fluttertools")
  end
  }
  use { 'Neevash/awesome-flutter-snippets', ft = "dart" }

  -- Markdown
  use { 'suan/vim-instant-markdown', ft = "markdown" }

  use { 'jubnzv/mdeval.nvim',
    config = function()
      require("config.mdeval")
    end, ft = { "markdown", "norg" },
  }
  -- orgmode
  use { "nvim-neorg/neorg",
    config = function()
      require("config.neorg")
    end,
    ft = "norg" }
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
  use { "https://github.com/mzlogin/vim-smali", ft = "smali" }
  -- python
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }


end)
