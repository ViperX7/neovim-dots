local saga = require 'lspsaga'

-- add your config value here
-- default value

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    diagnostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {quit = 'q', exec = '<CR>'},
    rename_action_keys = {
        quit = '<C-c>',
        exec = '<CR>' -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "single",
    rename_prompt_prefix = '➤',
    --     if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
    server_filetype_map = {}
}

-- require("highlights").highlight("LspSagaLightbulb",
--                                 {guifg = "NONE", guibg = "NONE"})

-- require("as.autocommands").augroup("LspSagaCursorCommands", {
--     {
--         events = {"CursorHold"},
--         targets = {"*"},
--         command = "lua require('lspsaga.diagnostic').show_cursor_diagnostics()"
--     }
-- {
--   events = {"CompleteDone"},
--   targets = {"*"},
--   command = "lua require('lspsaga.signaturehelp').signature_help()"
-- }
-- })
