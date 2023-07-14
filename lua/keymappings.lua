local utils = require('utils')
local map = utils.map

-------------------------------Vim Specific Key Mappings-----------------------------------
-- Sessions

-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

-- Movement
-- Move vertically by visual line
map('n', 'j', 'gj')
map('n', 'k', 'gk')
-- Move to beginning/end of line
map('n', 'B', '^')
map('n', 'E', '$')
-- $/^ doesn't do anything
map('n', '$', '<nop>')
map('n', '^', '<nop>')

-- Sessions
-- TODO Session Handelling
-- map('n', '<leader>so', ':OpenSession<Space>')
-- map('n', '<leader>ss', ':SaveSession<Space>')
-- map('n', '<leader>sd', ':DeleteSession<CR>')
-- map('n', '<leader>sc', ':CloseSession<CR>')

-- Tabs
-- map('n','<Tab>','gt')
-- map('n','<S-Tab>','gT')
-- map('n', '<silent> <S-t>', ':tabnew<CR>')

-- Command key optimisation : = ;
-- map('n',':',';')

-- Set working directory
map('n', '<leader>.', ':lcd %:p:h<CR>')

-- Split
map('n', '<leader>h', ':<C-u>split<CR>')
map('n', '<leader>v', ':<C-u>vsplit<CR>')

-- Easy window navigation
-- map('', '<C-h>', '<C-w>h', {})
-- map('', '<C-j>', '<C-w>j', {})
-- map('', '<C-k>', '<C-w>k', {})
-- map('', '<C-l>', '<C-w>l', {})

-- Use alt + hjkl to resize windows
map('n', '<M-h>', ':lua require("tmux").resize_left()<CR>')
map('n', '<M-l>', ':lua require("tmux").resize_right()<CR>')
map('n', '<M-k>', ':lua require("tmux").resize_top()<CR>')
map('n', '<M-j>', ':lua require("tmux").resize_bottom()<CR>')

-- Visual mode Text Selection
-- Vmap for maintain Visual Mode after shifting > and <
-- map('v', '<', '<gv', {})
-- map('v', '>', '>gv', {})
map('v', '<left>', '<gv', {})
map('v', '<right>', '>gv', {})
map('v', '<down>', ":m '>+1<CR>gv=gv")
map('v', '<up>', ":m '<-2<CR>gv=gv")

-- Disable Arrow keys
map('n', '<Left>', ':echoe "Use h"<CR>')
map('n', '<Right>', ':echoe "Use l"<CR>')
map('n', '<Up>', ':echoe "Use k"<CR>')
map('n', '<Down>', ':echoe "Use j"<CR>')
map('n', 'l', 'w')
map('n', 'h', 'b')

-- Code Folding
-- space open/closes folds
map('n', '<M-f>', 'za')

-- Searching
-- Turn off search highlightset ignorecase
map('n', '<leader><space>', ':nohlsearch<CR>')

-- Light/dark modemode
map('n', '<localleader>td', ':set background=dark<CR>')
map('n', '<localleader>tl', ':set background=light<CR>')
-- Quitting
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':wq<CR>')
map('n', '<leader>W', ':wqall<CR>')
map('n', '<leader>Q', ':q!<CR>')
map('n', 'qq', ':q<CR>')


map('n', '<localleader>w', ':lua vim.lsp.buf.format({timeout_ms=5000})<CR>:w<CR>')

-- Copy/Paste/Cut
-- if vim.api.nvim_get_option('unnamedplus') then
vim.api.nvim_set_option('clipboard', 'unnamed,unnamedplus')
-- end

-- map('n', '<leader>p', '+gP<CR>')

-- TODO
-- if has('macunix')
--   -- " pbcopy for OSX copy/paste
--   vmap <C-x> :!pbcopy<CR>
--   vmap <C-c> :w !pbcopy<CR><CR>
-- endif

map('i', 'jk', '<Esc>') -- jk to escape
map('i', 'kj', '<Esc>') -- jk to escape
-- map('', 'lh', '<Esc>:w<cr>')           -- jk to escape
-------------------------------------------------------------------------------
---
------------------------  Feature Toggles -------------------------------------
-- Enable disable indent lines
map('n', '<leader>zi', ':IndentBlanklineToggle<CR>')



---------------------- Nvim-tree ------------------------------
map('n', '<leader>i', ':NvimTreeToggle<CR>')
-- map('n', '<leader>r', ':<NvimTreeRefreshCR>')
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')


------------------------ Neogit Diffview Gitsigns ----------------------------
map('n', '<leader>gs', '<cmd>Neogit<CR>')              -- Git status
map('n', '<leader>gd', '<cmd>DiffviewOpen<CR>')        -- Git diff
map('n', '<leader>gl', '<cmd>DiffviewFileHistory<CR>') -- Git log
---- Togglabless
map('n', '<leader>ggd', ':Gitsigns toggle_deleted<CR>')
map('n', '<leader>ggw', ':Gitsigns toggle_word_diff<CR>')
map('n', '<leader>ggl', ':Gitsigns toggle_linehl<CR>')
map('n', '<leader>ggn', ':Gitsigns toggle_numhl<CR>')
map('n', '<leader>ggb', ':Gitsigns toggle_current_line_blame<CR>')
map('n', '<leader>ggp', ':Gitsigns preview_hunk_inline<CR>')
--- Actions
map('n', '<leader>gas', ':Gitsigns stage_hunk<CR>')
map('n', '<leader>gar', ':Gitsigns reset_hunk<CR>')
map('n', '<leader>gaS', ':Gitsigns stage_buffer<CR>')
map('n', '<leader>gaR', ':Gitsigns reset_buffer<CR>')
map('v', '<leader>gas', ':Gitsigns stage_hunk<CR>')
map('v', '<leader>gar', ':Gitsigns reset_hunk<CR>')
map('v', '<leader>gaS', ':Gitsigns stage_buffer<CR>')
map('v', '<leader>gaR', ':Gitsigns reset_buffer<CR>')



-- local gs = package.loaded.gitsigns
-- -- Navigation
-- map('n', ']c', function()
--   if vim.wo.diff then return ']c' end
--   vim.schedule(function() gs.next_hunk() end)
--   return '<Ignore>'
-- end, {expr=true})
--
-- map('n', '[c', function()
--   if vim.wo.diff then return '[c' end
--   vim.schedule(function() gs.prev_hunk() end)
--   return '<Ignore>'
-- end, {expr=true})
--
-- -- Actions
-- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
-- map('n', '<leader>hu', gs.undo_stage_hunk)
-- map('n', '<leader>hR', gs.reset_buffer)
-- map('n', '<leader>hp', gs.preview_hunk)
-- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--
-- map('n', '<leader>hd', gs.diffthis)
-- map('n', '<leader>hD', function() gs.diffthis('~') end)
--



-- Text object
-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')




----------------------- Telescope --------------------------------
--- File Navigation
map('n', '<leader>fp', ':lua require"telescope".extensions.project.project{}<CR>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')

-- Insert stuff
map('n', '<leader>fe', '<cmd>Telescope symbols<cr>')
map('n', '<leader>fs', '<cmd>Telescope spell_suggest<cr>')
map('n', '<leader>p', '<cmd>Telescope registers<cr>')

-- lookup stuff
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Actions
map('n', '<leader>fc', '<cmd>Telescope commands<cr>')
map('n', '<leader>fo', '<cmd>Telescope colorscheme<cr>')

-- lsp stuff
map('n', 'gr', '<cmd>Telescope lsp_references<cr>')
map('n', 'gs', '<cmd>Telescope lsp_workspace_symbols<cr>')
map('n', 'gws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
map('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
map('n', 'gtd', '<cmd>Telescope lsp_type_definitions<cr>')

-- vim-flutter
map('n', '<leader>Fa', ':FlutterRun<cr>')
map('n', '<leader>Fo', ':FlutterOutline<cr>')
map('n', '<leader>Ft', ':FlutterVSplit<cr>')
map('n', '<leader>FF', ':DartFmt<cr>')
map('n', '<leader>FQ', ':FlutterQuit<cr>')
map('n', '<leader>FR', ':FlutterRestart<cr>')
map('n', '<leader>Fr', ':FlutterReload<cr>')
map('n', '<leader>Fd', ':FlutterDevices<cr>')
map('n', '<leader>FD', ':FlutterVisualDebug<cr>')

-- SnipRun
-- map('n', '<S-CR>', ':SnipRun<cr>')
map('n', '<leader>rf', ':lua require"sniprun".run("n")<CR>')
map('n', '<leader>rr', ':w<cr>:RunCode<CR>')
map('v', '<leader>rr', ':w<cr>:lua require"sniprun".run("v")<cr>')
map('n', '<leader>ri', ':lua require"sniprun.live_mode".toggle()<CR>')

map('n', '<localleader>ri', ':MagmaInit<CR>1<CR><CR>')
map('n', '<localleader>rs', ':MagmaShow<CR>')
map('n', '<localleader>rl', ':MagmaEvaluateLine<CR>')
map('n', '<localleader>rr', ':MagmaReevaluateCell<CR>')
map('n', '<S-CR>', '0v/@<CR>k$:<BS><BS><BS><BS><BS>MagmaEvaluateVisual<CR>:nohlsearch<CR>')
map('v', '<S-CR>', ':<BS><BS><BS><BS><BS>MagmaEvaluateVisual<CR>')
-- map('n', 'm', '0v/@<CR>k$:<BS><BS><BS><BS><BS>MagmaEvaluateVisual<CR>:nohlsearch<CR>')
-- map('v', 'm', ':<BS><BS><BS><BS><BS>MagmaEvaluateVisual<CR>')

---------------------- Binsploit specific keybindings -----------------------
map('n', '<leader>sr', ':lua _binspgdb_toggle("remote")<CR>')

map('n', '<leader>ss', ':lua _binspgdb_toggle("")<CR>')
map('n', '<leader>sp', ':lua _binspgdb_toggle("preload")<CR>')
map('n', '<leader>si', ':lua _binspgdb_toggle("reinit")<CR>')

map('n', '<leader>sdd', ':lua _binspgdb_toggle("gdb")<CR>')
map('n', '<leader>sdp', ':lua _binspgdb_toggle("gdb preload")<CR>')
map('n', '<leader>sdi', ':lua _binspgdb_toggle("gdb reinit")<CR>')

-- xxxxxxxxxxxxxxxxxxxxxxxxxx Binsploit specific keybindings END xxxxxxxxxxxxx

-- Neogen
map('n', '<leader>cp', ':Neogen file<CR>')
map('n', '<leader>cf', ':Neogen func<CR>')
map('n', '<leader>cc', ':Neogen class<CR>')
map('n', '<leader>ct', ':Neogen type<CR>')

---------------------- hop -----------------------------
-- map('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})
-- map('n', 'S', ":HopWord<cr>", {})

-- Symbol outline
map('n', '<leader>o', ':SymbolsOutline<CR>', {})

----------------------- nvim-compe --------------------------
-- map('i', '<silent><expr> <C-Space>', 'compe#complete()')
-- map('i', '<silent><expr> <CR>     ', 'compe#confirm("<CR>")')
-- map('i', '<silent><expr> <C-e>    ', 'compe#close("<C-e>")')
-- map('i', '<silent><expr> <C-f>    ', 'compe#scroll({ "delta": +4 })')
-- map('i', '<silent><expr> <C-d>    ', 'compe#scroll({ "delta": -4 })')

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Workspace Related
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- map("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

------------------------- Trouble ----------------------------------
map('n', '<leader>d', ':TroubleToggle<CR>', opts)

------------------------- Bufferline --------------------------------

local opt = { silent = true }

-- command that adds new buffer and moves to it
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
-- map("n","<S->",":New ", opt)

-- removing a buffer
map("n", "<S-x>", ":lua require('bufdelete').bufdelete(0, true)<CR>", opt)

-- tabnext and tabprev
map("n", "<S-l>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-h>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
map("n", "<M-b>", ':BufferLinePick<CR>', opt)

----------------------- Ranger ----------------------------------

map("n", "<localleader>o", ':RnvimrToggle<CR>', opt)


----------------------- Mdeval ----------------------------------
map("n", "<leader>ee", ':MdEval<CR>', opt)
map("n", "<leader>ec", ':MdEvalClean<CR>', opt)


----------------------- Neorg ----------------------------------
map("n", "<leader>ew", ':lua vim.lsp.buf.formatting_sync()<CR>:w<CR>:Neorg tangle current-file<CR>', opt)
map("n", "<leader>bo", ':Neorg keybind all core.looking-glass.magnify-code-block<CR>', opt)
map("n", "<leader>be", ':FeMaco<CR>', opt)
map("n", "<leader>np", ':Neorg presenter start<CR>:set colorcolumn=400<CR>:IndentBlankLineDisable<cr>', opt)

------------------------ goto preview --------------------------------
map("n", "gp", ':lua require("goto-preview").goto_preview_definition()<CR>', opt)
map("n", "gpi", ':lua require("goto-preview").goto_preview_implementatiol()<CR>', opt)
map("n", "gpd", ':lua require("goto-preview").close_all_win()<CR>', opt)

------------------------ LSP Saga --------------------------------

map("n", "gh", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
-- jump diagnostic
map("n", "]c", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map("n", "[c", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
map("n", "<c-k>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

map("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map("v", "<leader>ca", ":<c-u>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)

--  packer

map("n", "<localleader>pi", ':Lazy install<CR>', opt)
map("n", "<localleader>pc", ':Lazy clean<CR>', opt)
map("n", "<localleader>pu", ':Lazy update<CR>', opt)
map("n", "<localleader>pp", ':Lazy profile<CR>', opt)
map("n", "<localleader>py", ':Lazy sync<CR>', opt)
map("n", "<localleader>po", ':Lazy compile<CR>', opt)


-- startuptime

map("n", "<leader>ls", ':StartupTime<CR>', opt)
map("n", "<leader>ll", ':StartupTime --tries 100<CR>', opt)


-- map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)

-- scroll down hover doc
-- map("n", "<C-f>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
-- -- scroll up hover doc
-- map("n", "<C-b>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)

-- map("n", "<localleader>cc", ':Codeium Enable<CR>:lua vim.notify("Codeium Enabled")<CR>', opt)
map("n", "<localleader>cc",
':lua vim.g.codeium_enabled = (vim.g.codeium_enabled==false)<CR>:lua vim.notify("Codeium Toggled")<CR>', opt)
