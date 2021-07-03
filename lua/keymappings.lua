local utils = require('utils')



-------------------------------Vim Specific Key Mappings-----------------------------------

-- Leader
  vim.g.mapleader = ','


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
  -- utils.map('n','<Tab>','gt')
  -- utils.map('n','<S-Tab>','gT')
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
        utils.map('n','<M-f>','za')

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

 
utils.map('i', 'jk', '<Esc>')           -- jk to escape
-- utils.map('', 'lh', '<Esc>:w<cr>')           -- jk to escape
-------------------------------------------------------------------------------







---------------------- Nvim-tree ------------------------------
  utils.map('n', '<M-i>', ':NvimTreeToggle<CR>')
  -- utils.map('n', '<leader>r', ':<NvimTreeRefreshCR>')
  -- utils.map('n', '<leader>n', ':NvimTreeFindFile<CR>')
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },

      { key = "v",                        cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "t",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "h",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "i",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
    }




------------------------ FuGITive -------------------------------
  utils.map('n', '<Leader>gs', '<cmd>Gstatus<CR>')  -- Git status

----------------------- Telescope --------------------------------
    utils.map('n','<leader>ff','<cmd>Telescope find_files<cr>')
    utils.map('n','<leader>fe','<cmd>Telescope symbols<cr>')
    utils.map('n','<leader>fm','<cmd>Telescope man_pages<cr>')
    utils.map('n','<leader>fg','<cmd>Telescope live_grep<cr>')
    utils.map('n',';','<cmd>Telescope buffers<cr>')
    utils.map('n','<leader>fh','<cmd>Telescope help_tags<cr>')
    utils.map('n','<leader>ca','<cmd>Telescope lsp_code_actions<cr>')
    utils.map('v','<leader>ca','<cmd>Telescope lsp_range_code_actions<cr>')





------------------------Multiple cursors keybindings-----------------------
-- Select n keywords with several keystrokes

    utils.map('n','<silent> <M-j>',':MultipleCursorsFind <C-R>/<CR>')
    utils.map('v','<silent> <M-j>',':MultipleCursorsFind <C-R>/<')

-- vim-flutter
    utils.map('n','<leader>Fa',':FlutterRun<cr>')
    utils.map('n','<leader>Ft',':FlutterVSplit<cr>')
    utils.map('n','<leader>FF',':DartFmt<cr>')
    utils.map('n','<leader>FQ',':FlutterQuit<cr>')
    utils.map('n','<leader>FR',':FlutterRestart<cr>')
    utils.map('n','<leader>Fr',':FlutterReload<cr>')
    utils.map('n','<leader>Fd',':FlutterDevices<cr>')
    utils.map('n','<leader>FD',':FlutterVisualDebug<cr>')


---------------------- hop -----------------------------
    utils.map('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})

    -- TagBar
    utils.map('n','<F8>',':TagbarOpenAutoClose<CR>',{})

----------------------- nvim-compe --------------------------
    utils.map('i','<silent><expr> <C-Space>','compe#complete()')
    utils.map('i','<silent><expr> <CR>     ','compe#confirm("<CR>")')
    utils.map('i','<silent><expr> <C-e>    ','compe#close("<C-e>")')
    utils.map('i','<silent><expr> <C-f>    ','compe#scroll({ "delta": +4 })')
    utils.map('i','<silent><expr> <C-d>    ','compe#scroll({ "delta": -4 })')

------------------------- Bufferline --------------------------------

    local opt = {silent = true}


    --command that adds new buffer and moves to it
    vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
    -- utils.map("n","<S->",":New ", opt)

    --removing a buffer
    utils.map("n","<S-x>",[[<Cmd>bdelete<CR>]], opt)

    -- tabnext and tabprev
    utils.map("n", "<S-l>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
    -- utils.map("n", "<S-s>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
    utils.map("n", "<M-b>", ':BufferLinePick<CR>', opt)

----------------------- Ranger ----------------------------------
    
    utils.map("n", "<Space>f", ':RnvimrToggle<CR>', opt)

