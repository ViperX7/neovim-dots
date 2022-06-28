local utils = require('utils')
local map = utils.map

-------------------------------Vim Specific Key Mappings-----------------------------------

-- leader
vim.g.mapleader = ' '

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
map('n', '<leader>so', ':OpenSession<Space>')
map('n', '<leader>ss', ':SaveSession<Space>')
map('n', '<leader>sd', ':DeleteSession<CR>')
map('n', '<leader>sc', ':CloseSession<CR>')

-- Tabs
-- map('n','<Tab>','gt')
-- map('n','<S-Tab>','gT')
map('n', '<silent> <S-t>', ':tabnew<CR>')

-- Command key optimisation : = ;
-- map('n',':',';')

-- Set working directory
map('n', '<leader>.', ':lcd %:p:h<CR>')

-- SUSPENDED in favour of fuzzy finder
-- Opens an edit command with the path of the currently edited file filled in
-- noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
-- " Open vsplit edit command with the path of the currently edited file filled
-- noremap <leader>ev :vsplit <C-R>=expand("%:p:h") . "/" <CR>
-- " Opens a tab edit command with the path of the currently edited file filled
-- noremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

-- Enable dissable indent lines
map('n', '<leader>zi', ':IndentBlanklineToggle<CR>')

-- Split
map('n', '<leader>h', ':<C-u>split<CR>')
map('n', '<leader>v', ':<C-u>vsplit<CR>')

-- Easy window navigation
map('', '<C-h>', '<C-w>h', {})
map('', '<C-j>', '<C-w>j', {})
map('', '<C-k>', '<C-w>k', {})
map('', '<C-l>', '<C-w>l', {})

-- Use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
map('n', '<M-h>', ':vertical resize -2<CR>')
map('n', '<M-l>', ':vertical resize +2<CR>')

-- Visual mode Text Selection
-- Vmap for maintain Visual Mode after shifting > and <
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})

map('v', '<left>', '<gv', {})
map('v', '<right>', '>gv', {})

-- Move visual block
map('v', 'Jv', "m '>+1<CR>gv=gv")
map('v', 'K', "m '<-2<CR>gv=gv")
map('v', '<down>', ":m '>+1<CR>gv=gv")
map('v', '<up>', ":m '<-2<CR>gv=gv")

-- Dissable Arrow keys
map('n', '<Left>', ':echoe "Use h"<CR>')
map('n', '<Right>', ':echoe "Use l"<CR>')
map('n', '<Up>', ':echoe "Use k"<CR>')
map('n', '<Down>', ':echoe "Use j"<CR>')

-- Code Folding
-- space open/closes folds
map('n', '<M-f>', 'za')

-- Searching
-- Turn off search highlightset ignorecase
map('n', '<leader><space>', ':nohlsearch<CR>')

-- Quiting
map('n', '<leader>w', ':lua vim.lsp.buf.formatting_sync()<CR>:w<CR>')
map('n', '<leader>q', ':wq<CR>')
map('n', '<leader>W', ':wqall<CR>')
map('n', '<leader>Q', ':q!<CR>')
map('n', 'qq', ':q<CR>')

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

---------------------- Nvim-tree ------------------------------
map('n', '<leader>i', ':NvimTreeToggle<CR>')
-- map('n', '<leader>r', ':<NvimTreeRefreshCR>')
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')

------------------------ Neogit Diffview Gitsigns ----------------------------
map('n', '<leader>gs', '<cmd>Neogit<CR>') -- Git status
map('n', '<leader>gd', '<cmd>DiffviewOpen<CR>') -- Git diff
map('n', '<leader>gl', '<cmd>DiffviewFileHistory<CR>') -- Git log
---- Togglabless
map('n', '<leader>gtd', ':Gitsigns toggle_deleted<CR>')
map('n', '<leader>gtw', ':Gitsigns toggle_word_diff<CR>')
map('n', '<leader>gtl', ':Gitsigns toggle_linehl<CR>')
map('n', '<leader>gtn', ':Gitsigns toggle_numhl<CR>')
map('n', '<leader>gtb', ':Gitsigns toggle_current_line_blame<CR>')

----------------------- Telescope --------------------------------
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fe', '<cmd>Telescope symbols<cr>')
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fp', ':lua require"telescope".extensions.project.project{}<CR>')
map('n', ';', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>p', '<cmd>Telescope registers<cr>')
map('n', 'gr', '<cmd>Telescope lsp_references<cr>')


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
map('n', '<S-CR>', ':SnipRun<cr>')
map('v', '<S-CR>', ':lua require"sniprun".run("v")<cr>')
map('n', '<leader>rf', ':lua require"sniprun".run("n")<CR>')
map('n', '<leader>rr', ':RunCode<CR>')
map('n', '<leader>ri', ':lua require"sniprun.live_mode".toggle()<CR>')

---------------------- hop -----------------------------
map('n', 'S', "<cmd>lua require'hop'.hint_char2()<cr>", {})
map('n', 's', ":HopWord<cr>", {})

-- Symbol outline
map('n', '<F8>', ':SymbolsOutline<CR>', {})

----------------------- nvim-compe --------------------------
map('i', '<silent><expr> <C-Space>', 'compe#complete()')
map('i', '<silent><expr> <CR>     ', 'compe#confirm("<CR>")')
map('i', '<silent><expr> <C-e>    ', 'compe#close("<C-e>")')
map('i', '<silent><expr> <C-f>    ', 'compe#scroll({ "delta": +4 })')
map('i', '<silent><expr> <C-d>    ', 'compe#scroll({ "delta": -4 })')

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

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

map("n", "<leader>o", ':RnvimrToggle<CR>', opt)


----------------------- Mdeval ----------------------------------
map("n", "<leader>ee", ':MdEval<CR>', opt)
map("n", "<leader>ec", ':MdEvalClean<CR>', opt)


----------------------- Neorg ----------------------------------
map("n", "<leader>ew", ':Neorg tangle<CR>', opt)

------------------------ LSP Saga --------------------------------
map("n", "gp", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
map("n", "gh", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)

-- jump diagnostic
map("n", "]c", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map("n", "[c", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
map("i", "<c-k>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

map("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map("v", "<leader>ca", ":<c-u>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)

--  packer

map("n", "<leader>Pi", ':PackerInstall<CR>', opt)
map("n", "<leader>Pc", ':PackerClean<CR>', opt)
map("n", "<leader>Pu", ':PackerUpdate<CR>', opt)
map("n", "<leader>Ps", ':PackerStatus<CR>', opt)
map("n", "<leader>Py", ':PackerSync<CR>', opt)
map("n", "<leader>Po", ':PackerCompile<CR>', opt)


-- startuptime

map("n", "<leader>ls", ':StartupTime<CR>', opt)
map("n", "<leader>ll", ':StartupTime --tries 100<CR>', opt)


-- map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)

-- scroll down hover doc
-- map("n", "<C-f>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
-- -- scroll up hover doc
-- map("n", "<C-b>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
