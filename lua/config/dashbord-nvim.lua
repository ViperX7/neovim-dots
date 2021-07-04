g = vim.g

g.dashboard_default_executive ='telescope'
g.dashboard_custom_header = {
      '              ▄▄▄▄▄▄▄▄▄            ',
      '           ▄█████████████▄          ',
      '   █████  █████████████████  █████  ',
      '   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ',
      '    █████▄  ▀███▄   ▄███▀  ▄█████    ',
      '    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ',
      '     ███▄▀███▄  ▀███▀  ▄███▀▄███    ',
      '     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ',
      '      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ',
      '       ▀███▄▀██ █████ ██▀▄███▀      ',
      '      █▄ ▀█████ █████ █████▀ ▄█      ',
      '      ███        ███        ███      ',
      '      ███▄    ▄█ ███ █▄    ▄███      ',
      '      █████ ▄███ ███ ███▄ █████      ',
      '      █████ ████ ███ ████ █████      ',
      '      █████ ████▄▄▄▄▄████ █████      ',
      '       ▀███ █████████████ ███▀      ',
      '         ▀█ ███ ▄▄▄▄▄ ███ █▀        ',
      '            ▀█▌▐█████▌▐█▀            ',
      '               ███████              ',
   }

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'},
    f = {description = {' File Manager        '}, command = 'RnvimrToggle'}
    -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
}


-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',

-- vim.g.dashboard_session_directory = '~/.cache/nvim/session'
vim.g.dashboard_custom_footer = {'ViperX7'}

