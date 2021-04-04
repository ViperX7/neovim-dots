local utils = require('utils')



-------------------------------Vim Specific Key Mappings-----------------------------------

-- Leader
  vim.g.mapleader = ' '


-- Movement
  -- Move vertically by visual line
    utils.map('n','j','gj')
    utils.map('n','k','gk')
  -- Move to beginning/end of line
    utils.map('n','B','^')
    utils.map('n','E','$')
  -- $/^ doesn't do anything
    utils.map('n','$','<nop>')
    utils.map('n','^','<nop>')


-- Sessions
  utils.map('n','<leader>so' ,':OpenSession<Space>')
  utils.map('n','<leader>ss' ,':SaveSession<Space>')
  utils.map('n','<leader>sd' ,':DeleteSession<CR>')
  utils.map('n','<leader>sc' ,':CloseSession<CR>')


-- Tabs
  utils.map('n','<Tab>','gt')
  utils.map('n','<S-Tab>','gT')
  utils.map('n','<silent> <S-t>',':tabnew<CR')

-- Command key optimisation : = ;
    -- utils.map('n',':',';')

-- Set working directory
  utils.map('n','<leader>.',':lcd %:p:h<CR>')

  -- SUSPENDED in favour of fuzzy finder
  -- Opens an edit command with the path of the currently edited file filled in
      -- noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
  -- " Open vsplit edit command with the path of the currently edited file filled 
       -- noremap <Leader>ev :vsplit <C-R>=expand("%:p:h") . "/" <CR>
  -- " Opens a tab edit command with the path of the currently edited file filled
       -- noremap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

-- Enable dissable indent lines
  utils.map('n','<leader>zi',':IndentLinesToggle<CR>')

-- Split
  utils.map('n','<Leader>h',':<C-u>split<CR>')
  utils.map('n','<Leader>v',':<C-u>vsplit<CR>')

-- Easy window navigation
  utils.map('','<C-h>','<C-w>h',{})
  utils.map('','<C-j>','<C-w>j',{})
  utils.map('','<C-k>','<C-w>k',{})
  utils.map('','<C-l>','<C-w>l',{})

-- Use alt + hjkl to resize windows
  utils.map('n','<M-j>',':resize -2<CR>')
  utils.map('n','<M-k>',':resize +2<CR>')
  utils.map('n','<M-h>',':vertical resize -2<CR>')
  utils.map('n','<M-l>',':vertical resize +2<CR>')

-- Visual mode Text Selection
  -- Vmap for maintain Visual Mode after shifting > and <
    utils.map('v','<','<gv',{})
    utils.map('v','>','>gv',{})

    utils.map('v','<left>','<gv',{})
    utils.map('v','<right>','>gv',{})

  -- Move visual block
    utils.map('v','Jv',"m '>+1<CR>gv=gv")
    utils.map('v','K',"m '<-2<CR>gv=gv")
    utils.map('v','<down>',":m '>+1<CR>gv=gv")
    utils.map('v','<up>',":m '<-2<CR>gv=gv")

  -- Dissable Arrow keys
    utils.map('n','<Left>',':echoe "Use h"<CR>')
    utils.map('n','<Right>',':echoe "Use l"<CR>')
    utils.map('n','<Up>',':echoe "Use k"<CR>')
    utils.map('n','<Down>',':echoe "Use j"<CR>')


-- Code Folding
    -- space open/closes folds
        utils.map('n','<space>f','za')

-- Searching
    -- Turn off search highlightset ignorecase
        utils.map('n','<leader><space>',':nohlsearch<CR>')

-- Copy/Paste/Cut
    -- if vim.api.nvim_get_option('unnamedplus') then
      vim.api.nvim_set_option('clipboard','unnamed,unnamedplus')
    -- end

    utils.map('n','YY','+y<CR>')
    utils.map('n','<leader>p','+gP<CR>')
    utils.map('n','XX','+x<CR>')

    -- TODO
    -- if has('macunix')
    --   -- " pbcopy for OSX copy/paste
    --   vmap <C-x> :!pbcopy<CR>
    --   vmap <C-c> :w !pbcopy<CR><CR>
    -- endif


-------------------------------------------------------------------------------






utils.map('i', 'jk', '<Esc>')           -- jk to escape

-- nvim-tree
  utils.map('n', '<C-n>', ':NvimTreeToggle<CR>')
  utils.map('n', '<leader>r', ':<NvimTreeRefreshCR>')
  utils.map('n', '<leader>n', ':NvimTreeFindFile<CR>')

-- fugitive
  local utils = require('utils')utils.map('n', '<Leader>gs', '<cmd>Gstatus<CR>')  -- Git status
