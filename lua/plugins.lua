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
    { 'Everblush/nvim',  name = 'everblush' },
    'nealmckee/penumbra',
    'shaunsingh/moonlight.nvim',
    'marko-cerovac/material.nvim',
    'rmehri01/onenord.nvim',
    'nyoom-engineering/oxocarbon.nvim',
    'NTBBloodbath/doom-one.nvim',
    { "catppuccin/nvim", name = "catppuccin" },
    {'Shatur/neovim-ayu'},
    'scottmckendry/cyberdream.nvim',
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
    { 'nvim-tree/nvim-web-devicons' },
  },


  --  Better UI --
  -- { "folke/noice.nvim", config = function() require("config.noice") end },

  -- Notifications --
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },

  -- LSP status indicator
  { 'j-hui/fidget.nvim',         config = function() require("fidget").setup() end, tag = "legacy" },



  -- -- lsp diagnostic indicator
  -- {
  --   "rachartier/tiny-inline-diagnostic.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require('tiny-inline-diagnostic').setup()
  --   end
  -- },

  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end
  },

  -- status line
  { 'nvim-lualine/lualine.nvim', config = function() require("config.lualine") end },
  -- { 'glepnir/galaxyline.nvim', branch = 'main',
  --   config = function() require("config.galaxyline") end }

  -- Tab line
  {
    'akinsho/bufferline.nvim',
    version = "*",
    config = function()
      require(
        "config.bufferline")
    end
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = { "SmiteshP/nvim-navic" },
    opts = require("config.barbecue"),
  },


  ----------------------------------------------------------------------
  -- Editor Enhancements
  ---------------------------------------------------------------------


  -- Welcome Dashoard
  -- { 'goolord/alpha-nvim',
  --   config = function() require 'alpha'.setup(require 'alpha.themes.dashboard'.config) end
  -- }

  {
    'nvimdev/dashboard-nvim',
    config = function()
      require('config.dashbord-nvim')
    end,
    dependencies = {
      "MaximilianLloyd/ascii.nvim",
    }
  },


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


  -- menus
  -- {
  --   { "nvchad/volt" , lazy = true },
  --   { "nvchad/menu" , lazy = true },
  -- },



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
    {
      'akinsho/git-conflict.nvim',
      version = "*",
      config = true
    } -- helps with git conflicts

  },


  -- Editor config support --
  { 'gpanders/editorconfig.nvim' },

  -- Buffer Management --
  { 'famiu/bufdelete.nvim' },

  -- Better code folding
  {
    'kevinhwang91/nvim-ufo',
    config = function() require("config.ufo") end,
    dependencies = { 'kevinhwang91/promise-async' }
  },

  -- fstring conversion auto
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false, -- plugin lazy-loads itself
  },



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
    {
      "ThePrimeagen/refactoring.nvim",
      config = function()
        require("refactoring").setup()
      end,
    },
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
    -- {
    -- 'MeanderingProgrammer/markdown.nvim',
    -- name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    -- dependencies = { 'nvim-treesitter/nvim-treesitter' },
    -- config = function()
    --     require('render-markdown').setup({})
    -- end,
    -- },
    -- {'dhruvasagar/vim-table-mode'}
    {
      "OXY2DEV/markview.nvim",
      config = function()
        require("markview").setup();
      end
    },
  },

  -- For plugin.lua users


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
    { 'p00f/nvim-ts-rainbow' },
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
      main = "ibl",
      opts = {},
      config = function()
        require("config.blankline-indent")
      end,
    },


    -- Colors
    {
      -- { "norcalli/nvim-colorizer.lua",        config = function() require("colorizer").setup() end },
      { "brenoprata10/nvim-highlight-colors", config = function() require('config.nvim-highlight-colors').setup() end }
    },
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
  -- {
  --   "ggandor/leap.nvim",
  --   config = function()
  --     local leap = require("leap")
  --     leap.add_default_mappings()
  --     leap.opts.safe_labels = {}
  --   end
  -- },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    --- @type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
    config = function()
      require("config.flash")
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
  -- TODO : Enable this
  -- { 'suan/vim-instant-markdown', ft = "markdown" },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1001, -- this plugin needs to run before anything else
  --   opts = {
  --       rocks = { "magick" },
  --   },
  -- },
  -- {
  --   '3rd/image.nvim',
  --   config = function()
  --     require("config.image")
  --   end
  -- },

  -- auto wrap
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },


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


  -- {
  --   'lukas-reineke/headlines.nvim',
  --   config = function()
  --     require('headlines').setup()
  --   end,
  --
  -- },

  -- Code runner
  { 'michaelb/sniprun',        build = 'bash ./install.sh' },
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





  -- AI plugins

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   config = function()
  --     require("config.avante")
  --   end,
  --
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     --- The below dependencies are optional,
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = { file_types = { "markdown", "Avante", "neoai-output", "neoai-input" } },
  --       ft = { "markdown", "Avante", "neoai-output", "neoai-input" },
  --     },
  --
  --   },
  -- },


  -- {
  --   "ViperX7/neoai.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = {
  --     "NeoAI",
  --     "NeoAIOpen",
  --     "NeoAIClose",
  --     "NeoAIToggle",
  --     "NeoAIContext",
  --     "NeoAIContextOpen",
  --     "NeoAIContextClose",
  --     "NeoAIInject",
  --     "NeoAIInjectCode",
  --     "NeoAIInjectContext",
  --     "NeoAIInjectContextCode",
  --   },
  --   keys = {
  --     { "<leader>as", desc = "summarize text" },
  --     { "<leader>ag", desc = "generate git message" },
  --   },
  --   config = function()
  --     require("config.neoai")
  --   end,
  -- },
  {
    'huggingface/llm.nvim',
    opts = {},
    config = function()
      require("config.llm")
    end,

  },

  {
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        -- adapters = {
        --   ollama = function()
        --     return require("codecompanion.adapters").extend("openai", {
        --       env = {
        --         url = "http://trixbase:5000/v1/",
        --         api_key = "abc",
        --       },
        --       headers = {
        --         ["Content-Type"] = "application/json",
        --       },
        --       parameters = {
        --         sync = true,
        --       },
        --     })
        --   end,
        -- },


        strategies = {
          chat = {
            adapter = "openai",
          },
          inline = {
            adapter = "openai",
          },
          agent = {
            adapter = "openai",
          },
        },




      })
    end
  }


})
