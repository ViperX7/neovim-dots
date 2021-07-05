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
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    f = {description = {'  File Manager        '}, command = 'RnvimrToggle'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Configs            '}, command = ':e ~/.config/nvim/init.lua|:lcd %:p:h'},
    g = {description = {'  Marks              '}, command = 'Telescope marks'}
}


vim.g.dashboard_custom_shortcut = {
    a = 'f',
    find_word = 'SPC f a',
    last_session = 'SPC s l',
    new_file = 'SPC c n',
    book_marks = 'SPC f b',
    find_history = 'SPC f h',
    find_history = 'SPC f h',
}


vim.cmd("let g:dashboard_session_directory = $HOME..'/.config/nvim/.sessions'")
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

vim.api.nvim_exec([[
let g:dashboard_custom_footer = [ 'Loaded '..packages..' plugins']
]], false)

-- vim.g.dashboard_session_directory = '~/.cache/nvim/session'
-- vim.g.dashboard_custom_footer = {'ViperX7'}

