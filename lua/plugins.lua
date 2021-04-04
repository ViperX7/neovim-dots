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

----------------------------------------------------------------------
-- Editor Enhancements
---------------------------------------------------------------------
  -- Fuzzy finder
    use {'nvim-telescope/telescope.nvim',requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- File explorer 
    use {'kyazdani42/nvim-tree.lua', requires = {{'kyazdani42/nvim-web-devicons'}}}

  -- Vim dispatch
    use { 'tpope/vim-dispatch'  }

  -- Fugitive for Git
    use { 'tpope/vim-fugitive'  }



----------------------------------------------------------------------
-- Language Servers
---------------------------------------------------------------------
  -- LSP and completion
    use { 'neovim/nvim-lspconfig'  }
    use { 'nvim-lua/completion-nvim'  }
    -- Add symbols to completion menu
    use {'onsails/lspkind-nvim'}




-----------------------------------------------------
-- Language Specific
-----------------------------------------------------

-- Lua 
    use { 'tjdevries/nlua.nvim'}
      --  better Lua syntax highlighting
        use { 'euclidianAce/BetterLua.vim'}
      -- fancy lua folds, you can check this out.
        use { 'tjdevries/manillua.nvim'}


end)
