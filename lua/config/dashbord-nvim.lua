local db = require('dashboard')
db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    project = {
      enable = true,
    },
    disable_move = true,
    shortcut = {
      {
        desc = 'Update',
        icon = ' ',
        group = '@variable.builtin',
        action = 'Lazy update',
        key = 'u',
      },
      {
        icon = ' ',
        desc = 'Files',
        group = '@number',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = ' ',
        desc = 'Apps',
        group = 'String',
        action = 'Telescope app',
        key = 'a',
      },
      {
        icon = ' ',
        desc = 'Projects',
        group = 'Constant',
        action = 'Telescope project',
        key = 'p',
      },
    },
  },
  -- preview = {
  --   command = 'cat | lolcat -F 0.3',
  --   file_path = vim.env.HOME .. '/.config/nvim/static/neovim.cat',
  --   file_height = 11,
  --   file_width = 70,
  -- },
})
vim.api.nvim_create_autocmd('TabNewEntered', {
  callback = function()
    vim.cmd('Dashboard')
  end
})
