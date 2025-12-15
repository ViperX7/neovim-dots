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
    { 'Everblush/nvim',   name = 'everblush' },
    'nealmckee/penumbra',
    'shaunsingh/moonlight.nvim',
    'marko-cerovac/material.nvim',
    'rmehri01/onenord.nvim',
    'nyoom-engineering/oxocarbon.nvim',
    'NTBBloodbath/doom-one.nvim',
    { "catppuccin/nvim",  name = "catppuccin" },
    { 'Shatur/neovim-ayu' },
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

  -- provides the winbar at the top
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function() require('config.dropbar') end
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



  -- animations sure do have a cost makes the config a little ugly
  {
    "y3owk1n/undo-glow.nvim",
    event = { "VeryLazy" },
    ---@type UndoGlow.Config
    opts = {
      animation = {
        enabled = true,
        duration = 300,
        animtion_type = "zoom",
        window_scoped = true,
      },
      highlights = {
        undo = {
          hl_color = { bg = "#693232" }, -- Dark muted red
        },
        redo = {
          hl_color = { bg = "#2F4640" }, -- Dark muted green
        },
        yank = {
          hl_color = { bg = "#7A683A" }, -- Dark muted yellow
        },
        paste = {
          hl_color = { bg = "#325B5B" }, -- Dark muted cyan
        },
        search = {
          hl_color = { bg = "#5C475C" }, -- Dark muted purple
        },
        comment = {
          hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
        },
        cursor = {
          hl_color = { bg = "#793D54" }, -- Dark muted pink
        },
      },
      priority = 2048 * 3,
    },
    keys = {
      {
        "u",
        function()
          require("undo-glow").undo()
        end,
        mode = "n",
        desc = "Undo with highlight",
        noremap = true,
      },
      {
        "U",
        function()
          require("undo-glow").redo()
        end,
        mode = "n",
        desc = "Redo with highlight",
        noremap = true,
      },
      {
        "p",
        function()
          require("undo-glow").paste_below()
        end,
        mode = "n",
        desc = "Paste below with highlight",
        noremap = true,
      },
      {
        "P",
        function()
          require("undo-glow").paste_above()
        end,
        mode = "n",
        desc = "Paste above with highlight",
        noremap = true,
      },
      {
        "n",
        function()
          require("undo-glow").search_next({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search next with highlight",
        noremap = true,
      },
      {
        "N",
        function()
          require("undo-glow").search_prev({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search prev with highlight",
        noremap = true,
      },
      {
        "*",
        function()
          require("undo-glow").search_star({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search star with highlight",
        noremap = true,
      },
      {
        "#",
        function()
          require("undo-glow").search_hash({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search hash with highlight",
        noremap = true,
      },
      {
        "gc",
        function()
          -- This is an implementation to preserve the cursor position
          local pos = vim.fn.getpos(".")
          vim.schedule(function()
            vim.fn.setpos(".", pos)
          end)
          return require("undo-glow").comment()
        end,
        mode = { "n", "x" },
        desc = "Toggle comment with highlight",
        expr = true,
        noremap = true,
      },
      {
        "gc",
        function()
          require("undo-glow").comment_textobject()
        end,
        mode = "o",
        desc = "Comment textobject with highlight",
        noremap = true,
      },
      {
        "gcc",
        function()
          return require("undo-glow").comment_line()
        end,
        mode = "n",
        desc = "Toggle comment line with highlight",
        expr = true,
        noremap = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        callback = function()
          require("undo-glow").yank()
        end,
      })

      -- This only handles neovim instance and do not highlight when switching panes in tmux
      vim.api.nvim_create_autocmd("CursorMoved", {
        desc = "Highlight when cursor moved significantly",
        callback = function()
          require("undo-glow").cursor_moved({
            animation = {
              animation_type = "slide",
            },
          })
        end,
      })

      -- This will handle highlights when focus gained, including switching panes in tmux
      vim.api.nvim_create_autocmd("FocusGained", {
        desc = "Highlight when focus gained",
        callback = function()
          ---@type UndoGlow.CommandOpts
          local opts = {
            animation = {
              animation_type = "slide",
            },
          }

          opts = require("undo-glow.utils").merge_command_opts("UgCursor", opts)
          local current_row = vim.api.nvim_win_get_cursor(0)[1]
          local cur_line = vim.api.nvim_get_current_line()
          require("undo-glow").highlight_region(vim.tbl_extend("force", opts, {
            s_row = current_row - 1,
            s_col = 0,
            e_row = current_row - 1,
            e_col = #cur_line,
            force_edge = opts.force_edge == nil and true or opts.force_edge,
          }))
        end,
      })

      vim.api.nvim_create_autocmd("CmdLineLeave", {
        pattern = { "/", "?" },
        desc = "Highlight when search cmdline leave",
        callback = function()
          require("undo-glow").search_cmd({
            animation = {
              animation_type = "fade",
            },
          })
        end,
      })
    end,
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
    { 'nvimtools/none-ls.nvim',           config = function() require("config.nullls") end },

    {
      "ThePrimeagen/refactoring.nvim",
      config = function()
        require("refactoring").setup()
      end,
    },
  },


  { -- LSP Utils --

    -- Project diagnostics with LSP
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },

    -- Lsp utilities
    -- { 'tami5/lspsaga.nvim',    config = function() require("config.lspsaga") end },

    -- goto preview live
    { 'rmagatti/goto-preview', config = function() require("config.goto_preview") end },
  },


  -- { 'tzachar/cmp-tabnine', build = './install.sh' }


  -- Annotations and documentation
  { "danymat/neogen",        config = function() require('config.neogen') end },

  { -- Treesetter --
    { 'nvim-treesitter/nvim-treesitter', build=":TSUpdate", config = function() require("config.treesetter") end },
    { 'windwp/nvim-ts-autotag',          ft = { "html", "markdown", "xml" } },
    -- {
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
    -- -- Rainbow paren  -- depricated
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
      main = "ibl",
      opts = {},
      config = function()
        require("config.blankline-indent")
      end,
    },


    -- Colors
    {
      -- { "norcalli/nvim-colorizer.lua",        config = function() require("colorizer").setup() end },
      {
        "brenoprata10/nvim-highlight-colors",
        config = function()
          require('config.nvim-highlight-colors')
        end,
      }
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
    -- { 'hrsh7th/cmp-emoji' },
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
  { "mzlogin/vim-smali",    ft = "smali" },
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

  { "echasnovski/mini.diff" },

  {
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        -- display = {
        --   diff = {
        --     provider = "mini_diff",
        --   },
        -- },
        --
        display = {
          diff = {
            enabled = true,
            close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
            layout = "vertical",  -- vertical|horizontal split for default provider
            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
            provider = "default", -- default|mini_diff
          },
        },

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
