-- require('lualine').setup {
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      "NvimTree",
      "DiffviewFiles",
      statusline = {},
      winbar = {},
    },
    ignore_focus = {

      "NvimTree",
      "DiffviewFiles",
    },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode'},
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },

    lualine_y = {},
    lualine_x = { 'progress', 'location', },
    lualine_z = {'encoding', 'fileformat', 'filetype'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
