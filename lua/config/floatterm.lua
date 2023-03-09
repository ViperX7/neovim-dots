require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<F7>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true,
  shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved', -- single/double/shadow/curved
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
    -- this is the trick to make <esc> work properly since it's mapped below
    vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', "<esc>", { noremap = true })
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _binspgdb_toggle(args)
  -- gdb analysis pty reinit remote, preload raw print bin debug clean -s rich auto"
  local cmd = "python -u sol.py " .. args
  local binspgdb = Terminal:new({
    cmd = cmd,
    direction = "tab",
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
      -- this is the trick to make <esc> work properly since it's mapped below
      vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', "<esc>", { noremap = true })
    end,
  })
  binspgdb:toggle()
end

vim.api.nvim_set_keymap("n", "<Space>gz", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
