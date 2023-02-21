local neorg = require('neorg')

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.ui'] = {},
    -- ['core.neorgcmd'] = {},
    ['core.norg.concealer'] = {
      config = {
        -- markup_preset = 'dimmed',
        icon_preset = 'basic', -- diamond
        width = "content",
      },
    },
    -- ['core.integrations.treesitter '] = {},
    ['core.keybinds'] = {
      config = {
        default_keybings = true,
        neorg_leader = '<leader>n',
      },
    },
    ['core.norg.qol.toc'] = {
      config = {
        close_split_on_jump = false,
        toc_split_placement = 'right',
      },
    },
    -- ['core.norg.esupports.hop'] = {},
    -- ['core.integrations.telescope'] = {},
    -- ['core.zettelkasten'] = {},
    ['core.norg.journal'] = {
      config = {
        workspaces = 'journal',
      },
    },
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode',
        slide_count = {
          enable = true,
          position = 'top',
          count_format = '[%d/%d]',
        },
      },
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {
      config = {
        extensions = "all",
      }
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          main = '~/Documents/notes/neorg',
          journal = '~/Documents/notes/journal',
        },
      },
    },
  },
  logger = {
    level = 'warn',
  },
})
