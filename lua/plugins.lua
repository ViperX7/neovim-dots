return require('packer').startup(function()

    -- startup optimizations
    use {'lewis6991/impatient.nvim'}

    ----------------------------------------------------------------------
    -- Package Management
    ---------------------------------------------------------------------
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    ----------------------------------------------------------------------
    -- Visual Enhancement
    ---------------------------------------------------------------------
    -- Color scheme
    use {'sainnhe/gruvbox-material'}
    use {'joshdick/onedark.vim'}

    -- Indentation
    use {"lukas-reineke/indent-blankline.nvim"}

    ----------------------------------------------------------------------
    -- Editor Enhancements
    ---------------------------------------------------------------------
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Preview extension
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    -- use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Shortcut helper popup
    use 'folke/which-key.nvim'

    -- File explorer 
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'}
    -- File Manager
    use 'kevinhwang91/rnvimr'
    -- Vim dispatch
    use {'tpope/vim-dispatch'}

    -- Terminal
    use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end}

    -- Git related stuff
    use {'tpope/vim-fugitive'}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Tab line
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- treesetter
    use {'nvim-treesitter/nvim-treesitter'}

    -- Automatic line number toggle
    use {'jeffkreeftmeijer/vim-numbertoggle'}

    -- Mautiple cursors
    use {'terryma/vim-multiple-cursors'}

    -- Auto pairying helpers
    use {'jiangmiao/auto-pairs'}
    use {'tpope/vim-surround'}
    use {'p00f/nvim-ts-rainbow'}
    use 'andymass/vim-matchup'

    -- Registers Manager
    use 'gennaro-tedesco/nvim-peekup'

    -- Welcome Dashoard
    use {'glepnir/dashboard-nvim'}

    -- Commenting
    use {'tomtom/tcomment_vim'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Colors
    use "norcalli/nvim-colorizer.lua"

    -- Tagbar
    use {'majutsushi/tagbar'}
    use 'simrat39/symbols-outline.nvim'

    -- Fast movement
    -- use {'easymotion/vim-easymotion'}
    use 'phaazon/hop.nvim'
    use {'tpope/vim-repeat'}

    -- Scrolling
    use 'karb94/neoscroll.nvim'

    -- Snippets
    -- use {'hrsh7th/vim-vsnip'}
    -- use 'hrsh7th/vim-vsnip-integ'
    use {'SirVer/ultisnips'}
    use {'quangnguyen30192/cmp-nvim-ultisnips'}
    -- use {'honza/vim-snippets'}
    use('norcalli/snippets.nvim')

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'molleweide/LuaSnip-snippets.nvim'
    use {'rafamadriz/friendly-snippets'}


    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/cmp-emoji'

    use {'romgrk/fzy-lua-native', run = 'make'}
    use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}
    use {'tzachar/cmp-fuzzy-path', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}

    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'


    -- Timing plugin
    use "dstein64/vim-startuptime"

    -- Session Management
    use 'tpope/vim-obsession.git'
    -- ************************* Documentatoin *********************************
    -- vim wiki
    use {'vimwiki/vimwiki'} -- A personal wiki for vim

    ----------------------------------------------------------------------
    -- Language Servers
    ---------------------------------------------------------------------
    -- LSP and completion
    use {
    {
        "williamboman/nvim-lsp-installer",
        config = function ()
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
    -- use {'windwp/nvim-autopairs'}        -- Removed because unused
    -- use {'kosayoda/nvim-lightbulb'}      -- Removed because lspsaga does better
    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use 'folke/lsp-colors.nvim'

    use {'tami5/lspsaga.nvim'}

    -- use {'hrsh7th/nvim-compe'}
 	-- use {'tzachar/cmp-tabnine', run='./install.sh'}

    -- Add symbols to completion menu
    use {'onsails/lspkind-nvim'}

    -- Formating
    use "sbdchd/neoformat"
    -----------------------------------------------------------------------
    ----- Integration
    -----------------------------------------------------------------------
    -- TMUX navigation
    use {'christoomey/vim-tmux-navigator'}

    -----------------------------------------------------
    -- Language Specific
    -----------------------------------------------------

    -- Lua 
    use {'tjdevries/nlua.nvim'}
    --  better Lua syntax highlighting
    use {'euclidianAce/BetterLua.vim'}
    -- fancy lua folds, you can check this out.
    use {'tjdevries/manillua.nvim'}
    -- Flutter
    -- use {'thosakwe/vim-flutter'}
    use {'dart-lang/dart-vim-plugin'}
    use 'akinsho/flutter-tools.nvim'
    use 'Neevash/awesome-flutter-snippets'

    -- Markdown
    use {'suan/vim-instant-markdown'}
    use 'jubnzv/mdeval.nvim'
    -- orgmode
    use { "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.presenter"] = {}, 
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/neorg"
                            }
                        }
                    }
                },
            }
        end
    }

    -- Code runner
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}

    -- Python 
    -- use {'vim-python/python-syntax'} -- Better  Syntax Highliting


end)
