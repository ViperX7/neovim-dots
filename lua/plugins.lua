local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup({


  -- ------------------- Plugins  -----------------------

  ----------------------------------------------------------------------
  -- Package Management
  ---------------------------------------------------------------------
  -- Packer can manage itself as an optional plugin
  { 'wbthomason/packer.nvim' },

  ----------------------------------------------------------------------
  -- Visual Enhancement
  ---------------------------------------------------------------------

  {
    -- Color schemes --
    -- { 'olimorris/onedarkpro.nvim' }, -- removed because confiicts with others
    'navarasu/onedark.nvim',
    'sainnhe/gruvbox-material',
    'EdenEast/nightfox.nvim',
    'folke/tokyonight.nvim',
    'shaunsingh/moonlight.nvim',
    'marko-cerovac/material.nvim',
    'rmehri01/onenord.nvim',
    'NTBBloodbath/doom-one.nvim',
    { "catppuccin/nvim", name = "catppuccin" }
  },

  -- Essentials --
  {
    -- UI stuff
    { 'nvim-lua/plenary.nvim' },
    { "MunifTanjim/nui.nvim" },
    {
      'stevearc/dressing.nvim',
      init = function()
        require("config.dressing")
      end
    },
    -- Icons
    { 'kyazdani42/nvim-web-devicons' },
  },


  --  Better UI --
  -- { "folke/noice.nvim", config = function() require("config.noice") end }

  -- Notifications --
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
      require("notify").setup()
    end
  },

  -- LSP status indicator
  { 'j-hui/fidget.nvim',         config = function() require("fidget").setup() end },

  -- status line
  { 'nvim-lualine/lualine.nvim', config = function() require("config.lualine") end },
  -- { 'glepnir/galaxyline.nvim', branch = 'main',
  --   config = function() require("config.galaxyline") end }

  -- Tab line
  {
    'akinsho/bufferline.nvim',
    version = "v2.*",
    config = function()
      require(
        "config.bufferline")
    end
  },




  ----------------------------------------------------------------------
  -- Editor Enhancements
  ---------------------------------------------------------------------


  -- Welcome Dashoard
  -- { 'goolord/alpha-nvim',
  --   config = function() require 'alpha'.setup(require 'alpha.themes.dashboard'.config) end
  -- }

  {
    'glepnir/dashboard-nvim',
    config = function()
      require('config.dashbord-nvim')
    end,
  },
  { "MaximilianLloyd/ascii.nvim" },


  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = function() require("config.telescope") end,
    dependencies = {
      -- -- Preview extension
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    }
  },



  -- Sidebar File explorer --
  { 'kyazdani42/nvim-tree.lua',      config = function() require("config.nvim-tree") end },
  -- File Manager
  { 'kevinhwang91/rnvimr' },

  -- Shortcut helper popup --
  { 'folke/which-key.nvim',          config = function() require("config.which-key") end },

  -- Terminal --
  { "akinsho/toggleterm.nvim",       config = function() require("config.floatterm") end },

  -- Tagbar
  { "simrat39/symbols-outline.nvim", config = function() require("config.outline") end },

  -- Git related stuff
  {
    { 'lewis6991/gitsigns.nvim', config = function() require("config.gitsign") end }, -- git gigns in signcolumn
    { 'TimUntersberger/neogit',  config = function() require("config.neogit") end },  -- git manager
    { "sindrets/diffview.nvim" },                                                     -- diff helper
  },


  -- Editor config support --
  { 'gpanders/editorconfig.nvim' },

  -- Buffer Management --
  { 'famiu/bufdelete.nvim' },



  ----------------------------------------------------------------------
  -- Language Servers
  ---------------------------------------------------------------------
  { -- Lsp Manager --
    { "williamboman/mason.nvim",          config = function() require("mason").setup() end },

    -- LSP config providers
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig",            config = function() local lspconfig = require("lspconfig") end },

    -- Formatting
    { 'jose-elias-alvarez/null-ls.nvim',  config = function() require("config.nullls") end },
  },


  { -- LSP Utils --
    -- Diagnostic colors for lsp
    { 'folke/lsp-colors.nvim' },

    -- Project diagnostics with LSP
    { "folke/trouble.nvim", },

    -- Lsp utilities
    { 'tami5/lspsaga.nvim',    config = function() require("config.lspsaga") end },

    -- goto preview live
    { 'rmagatti/goto-preview', config = function() require("config.goto_preview") end },
  },





  -- { 'tzachar/cmp-tabnine', build = './install.sh' }


  -- Annotations and documentation
  { "danymat/neogen",        config = function() require('config.neogen') end },

  { -- Treesetter --
    { 'nvim-treesitter/nvim-treesitter', config = function() require("config.treesetter") end },
    { 'windwp/nvim-ts-autotag',          ft = { "html", "markdown", "xml" } },
  },


  {
    -- Comment --
    { 'JoosepAlviste/nvim-ts-context-commentstring', ft = { "html" } },
    { 'numToStr/Comment.nvim',                       config = function() require('Comment').setup() end },
    event = 'BufEnter'
  },

  {
    -- Parenthesis --
    -- Auto pairying helpers
    { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },
    -- Highlight pairs
    { 'andymass/vim-matchup' },
    -- Rainbow paren
    -- { 'p00f/nvim-ts-rainbow' },
    event = 'BufEnter'
  },

  {
    -- Feature Group --
    -- Automatic line number toggle
    { 'jeffkreeftmeijer/vim-numbertoggle' },
    -- Mautiple cursors
    { 'mg979/vim-visual-multi' },
    -- Indentation
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function() require("config.blankline-indent") end
    },
    -- Colors
    { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end },
    -- provides pair changing capabilities
    { "tpope/vim-surround" },
    event = 'BufEnter'
  },



  -- Commenting
  -- {'tomtom/tcomment_vim'}
  --


  -- Fast movement
  -- {'easymotion/vim-easymotion'}
  -- {
  --   'phaazon/hop.nvim',
  --   branch = 'v1', -- optional but strongly recommended
  --   config = function()
  --     require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- }
  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require("leap")
      leap.add_default_mappings()
      leap.opts.safe_labels = {}
    end
  },

  { 'tpope/vim-repeat' },

  -- Scrolling
  { 'karb94/neoscroll.nvim', config = function() require("config.neoscrool") end },

  ---------------------------------------------------------------------
  -- Code Actions --
  ---------------------------------------------------------------------
  {
    -- Completions --
    { 'hrsh7th/nvim-cmp',                    config = function() require("config.nvim-cmp") end },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'f3fora/cmp-spell' },
    { 'hrsh7th/cmp-emoji' },
    { 'andersevenrud/cmp-tmux' },

    { 'romgrk/fzy-lua-native',               build = 'make' },
    { 'tzachar/cmp-fuzzy-buffer',            dependencies = { 'tzachar/fuzzy.nvim' } },
    { 'tzachar/cmp-fuzzy-path',              dependencies = { 'tzachar/fuzzy.nvim' } },

    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },

    -- Add symbols to completion menu
    { 'onsails/lspkind-nvim',                config = function() require("config.lspkind") end },
  },


  {
    -- Snippets --
    -- {'hrsh7th/vim-vsnip'},
    -- use 'hrsh7th/vim-vsnip-integ',
    -- { 'SirVer/ultisnips',                   config = function() require("config.ultisnips") end },
    -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- {'honza/vim-snippets'},
    { 'norcalli/snippets.nvim' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'molleweide/LuaSnip-snippets.nvim' },
    { 'rafamadriz/friendly-snippets' },

  },



  -- Timing plugin
  { "dstein64/vim-startuptime" },

  -- Session Management
  -- use 'tpope/vim-obsession'
  -- ************************* Documentatoin *********************************
  -- vim wiki
  -- {'vimwiki/vimwiki'} -- A personal wiki for vim

  -----------------------------------------------------------------------
  ----- Integration
  -----------------------------------------------------------------------
  -- TMUX navigation
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  -- { 'christoomey/vim-tmux-navigator' }

  -----------------------------------------------------
  -- Language Specific
  -----------------------------------------------------

  -- Lua
  {
    { 'tjdevries/nlua.nvim' },
    { 'euclidianAce/BetterLua.vim' }, --  better Lua syntax highlighting
    { 'tjdevries/manillua.nvim' },    -- fancy lua folds, you can check this out.
    ft = "lua",
  },

  -- Flutter
  {
    -- { 'dart-lang/dart-vim-plugin', ft = "dart" },
    { 'akinsho/flutter-tools.nvim',       ft = "dart", config = function() require("config.fluttertools") end },
    { 'Neevash/awesome-flutter-snippets', ft = "dart" },
  },


  -- Markdown
  { 'suan/vim-instant-markdown', ft = "markdown" },

  {
    'jubnzv/mdeval.nvim',
    config = function()
      require("config.mdeval")
    end,
    ft = { "markdown", "norg" },
  },
  -- orgmode
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    config = function()
      require("config.neorg")
    end,
    ft = "norg",
    cmd = "Neorg"
  },
  {
    'ViperX7/nvim-FeMaco.lua',
    config = function() require("femaco").setup() end,
    ft = { "markdown", "norg", "neorg" }
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("config.zenmode")
    end
  },

  {
    'jdhao/better-escape.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.better_escape_shortcut = { "jk", "kj" }
      vim.g.better_escape_interval = 50
    end
  },


  {
    'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup()
    end,

  },

  -- Code runner
  { 'michaelb/sniprun',  build = 'bash ./install.sh' },
  {
    'CRAG666/code_runner.nvim',
    config = function()
      require("config.code_runner")
    end
  },

  -- smali reversing
  { "mzlogin/vim-smali", ft = "smali" },
  -- python

  {
    'dccsillag/magma-nvim',
    build = ':UpdateRemotePlugins',
    config = function()
      require("config.magma")
    end
  },


  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("codeium").setup({
      })
    end,
    keys = "<localleader>cs"
  },

  {
    'Exafunction/codeium.vim',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_enabled = 0
      vim.keymap.set('i', "<C-x>", function() return vim.fn['codeium#Accept']() end, { expr = true })
      -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end,
    -- keys = "<localleader>cc"
  },



})
