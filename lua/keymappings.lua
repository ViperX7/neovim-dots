local utils = require('utils')



utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape

-- nvim-tree
    utils.map('n', '<C-n>', ':NvimTreeToggle<CR>')
    utils.map('n', '<leader>r', ':<NvimTreeRefreshCR>')
    utils.map('n', '<leader>n', ':NvimTreeFindFile<CR>')
