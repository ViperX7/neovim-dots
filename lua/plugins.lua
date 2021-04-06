return require('packer').startup(function()

----------------------------------------------------------------------
-- Package Management
---------------------------------------------------------------------
  -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

----------------------------------------------------------------------
-- Visual Enhancement
---------------------------------------------------------------------
  -- Color scheme
    use { 'sainnhe/gruvbox-material'}
    use { 'joshdick/onedark.vim'}

  -- Indentation
    use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}


----------------------------------------------------------------------
-- Editor Enhancements
---------------------------------------------------------------------
  -- Fuzzy finder
    use {'nvim-telescope/telescope.nvim',requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}}}
      -- Preview extension
        use 'nvim-telescope/telescope-media-files.nvim'
        use 'nvim-telescope/telescope-symbols.nvim'

  -- File explorer 
    use {'kyazdani42/nvim-tree.lua', requires = {{'kyazdani42/nvim-web-devicons'}}}

  -- Vim dispatch
    use { 'tpope/vim-dispatch'  }

  -- Git related stuff
    use { 'tpope/vim-fugitive'  }
    use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'}}

  -- status line
    use {'glepnir/galaxyline.nvim',branch = 'main',requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- Tab line
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

  -- treesetter
    use {'nvim-treesitter/nvim-treesitter'}
  
  -- Automatic line number toggle
   use {'jeffkreeftmeijer/vim-numbertoggle'}

  -- Mautiple cursors
   use {'terryma/vim-multiple-cursors'}

  -- Auto pairying helpers
     use {'jiangmiao/auto-pairs'}
     use {'tpope/vim-surround' }

  -- Welcome Dashoard
   use {'glepnir/dashboard-nvim'}

  -- Commenting
    use {'tomtom/tcomment_vim'}

  -- Colors
    use "norcalli/nvim-colorizer.lua"


  -- Tagbar
    use {'majutsushi/tagbar'}

  -- Fast movement
    -- use {'easymotion/vim-easymotion'}
    use 'phaazon/hop.nvim'
    use {'tpope/vim-repeat'}

  -- Scrolling
    use 'karb94/neoscroll.nvim'

-- Snippets
    use {'hrsh7th/vim-vsnip'}
        use 'hrsh7th/vim-vsnip-integ'
        use {'rafamadriz/friendly-snippets'}
    -- use {'SirVer/ultisnips'}
    -- use {'honza/vim-snippets'}
    use('norcalli/snippets.nvim')

-- Timing plugin
    use "tweekmonster/startuptime.vim"

-- ************************* Documentatoin *********************************
-- vim wiki
    use {'vimwiki/vimwiki'}                      -- A personal wiki for vim



----------------------------------------------------------------------
-- Language Servers
---------------------------------------------------------------------
  -- LSP and completion
    use { 'neovim/nvim-lspconfig'}
    use {'windwp/nvim-autopairs'}
    use {'kosayoda/nvim-lightbulb'}
    -- use{'glepnir/lspsaga.nvim'}
    use {'hrsh7th/nvim-compe'}
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
    use { 'tjdevries/nlua.nvim'}
      --  better Lua syntax highlighting
        use { 'euclidianAce/BetterLua.vim'}
      -- fancy lua folds, you can check this out.
        use { 'tjdevries/manillua.nvim'}
-- Flutter
    -- use {'thosakwe/vim-flutter'}
    use {'dart-lang/dart-vim-plugin'}
    use 'akinsho/flutter-tools.nvim'
    use 'Neevash/awesome-flutter-snippets'


-- Markdown
    use {'suan/vim-instant-markdown'}


-- Python 
    use {'vim-python/python-syntax'}              -- Better  Syntax Highliting



end)
