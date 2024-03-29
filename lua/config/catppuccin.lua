require("catppuccin").setup({
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "frappe",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {

    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = true,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})


require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get()
}

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
