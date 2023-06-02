local g                        = vim.g
local tree_cb                  = require 'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_auto_ignore_ft     = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.

g.nvim_tree_width_allow_resize = 1                           -- 0 by default, will not resize the tree when opening a file


-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath

--  default will show icon by default if no icon is provided
--  default shows no icon by default

-- NvimTreeOpen and NvimTreeClose are also available if you need them


-- a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.



-- following options are the default
-- require'nvim-tree'.setup {
--   -- 0 by default
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 500,
--   },
--
--   -- 0 by default, this option hides files and folders starting with a dot `.`
--   filters = {
--     dotfiles = true,
--     custom = { '.git', 'node_modules', '.cache' }
--     }
--         ,
--
--     -- nvim_tree_indent_markers = true -- 0 by default, this option shows indent markers when folders are open
--     --
--     actions = {
--     use_system_clipboard = true,
--     change_dir = {
--       enable = true,
--       global = false,
--       restrict_above_cwd = false,
--     },
--     open_file = {
--           quit_on_open = false,
--           resize_window = false,
--           window_picker = {
--             enable = true,
--             chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--             exclude = {
--               filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
--               buftype = { "nofile", "terminal", "help" },
--             },
--           },
--         },
--       },
--
--     renderer = {
--         add_trailing = false,
--         group_empty = true,
--         highlight_git = true,
--         full_name = false,
--         highlight_opened_files = "name",
--         root_folder_modifier = ":~",
--         indent_markers = {
--           enable = true,
--           icons = {
--             corner = "└ ",
--             edge = "│",
--             item = "│ ",
--             none = "  ",
--           },
--         },
--         icons = {
--               webdev_colors = true,
--               git_placement = "before",
--               padding = " ",
--               symlink_arrow = " ➛ ",
--               show = {
--                 file = true,
--                 folder = true,
--                 folder_arrow = true,
--                 git = true,
--               },
--               glyphs = {
--                 default = "",
--                 symlink = "",
--                 folder = {
--                   arrow_closed = "",
--                   arrow_open = "",
--                   default = "",
--                   open = "",
--                   empty = "",
--                   empty_open = "",
--                   symlink = "",
--                   symlink_open = "",
--                 },
--                 git = {
--                   unstaged = "✗",
--                   staged = "✓",
--                   unmerged = "",
--                   renamed = "➜",
--                   untracked = "★",
--                   deleted = "",
--                   ignored = "◌",
--                 },
--             },
--         },
--   special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
--     },
--
--   hijack_directories = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = true,
--     show_on_dirs = true,
--     icons = {
--       hint = "",
--       info = "",
--       error = "",
--       warning = "",
--
--         },
--     },
--
--   auto_reload_on_write = true,
--   create_in_closed_folder = false,
--   hijack_unnamed_buffer_when_opening = false,
--   -- ignore_buffer_on_setup = false,
--   -- open_on_setup_file = false,
--   sort_by = "name",
--   reload_on_bufenter = true,
--   respect_buf_cwd = false,
--
--   -- disables netrw completely
--   disable_netrw       = false,
--   -- hijack netrw window on startup
--   hijack_netrw        = true,
--   -- open the tree when running this setup function
--   -- open_on_setup       = false,
--   -- will not open on setup if the filetype is in this list
--   -- ignore_ft_on_setup  = {},
--   -- closes neovim automatically when the tree is the last **WINDOW** in the view
--   -- auto_close          = true,
--   -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
--   open_on_tab         = true,
--   -- hijacks new directory buffers when they are opened.
--   -- update_to_buf_dir   = {enable = true, auto_open = true},
--   -- hijack the cursor in the tree to put it at the start of the filename
--   hijack_cursor       = true,
--   -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
--   update_cwd          = true,
--   -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
--   update_focused_file = {
--     -- enables the feature
--     enable      = true,
--     -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
--     -- only relevant when `update_focused_file.enable` is true
--     update_cwd  = true,
--     -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
--     -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
--     ignore_list = {}
--   },
--   -- configuration options for the system open command (`s` in the tree by default)
--   system_open = {
--     -- the command to run this, leaving nil should work in most cases
--     cmd  = nil,
--     -- the command arguments as a list
--     args = {}
--   },
--
--   view = {
--     adaptive_size = true,
--     centralize_selection = false,
--     -- height = 30,
--     hide_root_folder = false,
--     preserve_window_proportions = true,
--     number = false,
--     relativenumber = false,
--     signcolumn = "yes",
--     -- width of the window, can be either a number (columns) or a string in `%`
--     width = 30,
--     -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
--     side = 'left',
--     -- if true the tree will resize itself after opening a file
--     -- auto_resize = true,
--     mappings = {
--       -- custom only false will merge the list with the default mappings
--       -- if true, it will only use your list to set the mappings
--       custom_only = false,
--       -- list of mappings to set on the tree manually
--       list = {
--         {key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit")},
--         {key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd")},
--
--         {key = "v", cb = tree_cb("vsplit")}, {key = "<C-x>", cb = tree_cb("split")},
--         {key = "t", cb = tree_cb("tabnew")},
--         {key = "<", cb = tree_cb("prev_sibling")},
--         {key = ">", cb = tree_cb("next_sibling")},
--         {key = "P", cb = tree_cb("parent_node")},
--         {key = "<BS>", cb = tree_cb("close_node")},
--         {key = "h", cb = tree_cb("close_node")},
--         {key = "<Tab>", cb = tree_cb("preview")},
--         {key = "K", cb = tree_cb("first_sibling")},
--         {key = "J", cb = tree_cb("last_sibling")},
--         {key = "I", cb = tree_cb("toggle_ignored")},
--         {key = "H", cb = tree_cb("toggle_dotfiles")},
--         {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")},
--         {key = "d", cb = tree_cb("remove")}, {key = "r", cb = tree_cb("rename")},
--         {key = "<C-r>", cb = tree_cb("full_rename")},
--         {key = "x", cb = tree_cb("cut")}, {key = "c", cb = tree_cb("copy")},
--         {key = "p", cb = tree_cb("paste")}, {key = "y", cb = tree_cb("copy_name")},
--         {key = "Y", cb = tree_cb("copy_path")},
--         {key = "gy", cb = tree_cb("copy_absolute_path")},
--         {key = "[c", cb = tree_cb("prev_git_item")},
--         {key = "]c", cb = tree_cb("next_git_item")},
--         {key = "-", cb = tree_cb("dir_up")}, {key = "q", cb = tree_cb("close")},
--         {key = "i", cb = tree_cb("close")},
--         {key = "g?", cb = tree_cb("toggle_help")}
--       }
--     }
--   }
-- }
--
--

local function on_attach_nvim_keys(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'i', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))

end


require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = on_attach_nvim_keys,
  remove_keymaps = false,
  select_prompts = false,
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
        { key = { "<CR>", "l", "<2-LeftMouse>" }, cb = tree_cb("edit") },
        { key = { "<2-RightMouse>", "<C-]>" },    cb = tree_cb("cd") },
        { key = "v",                              cb = tree_cb("vsplit") }, { key = "<C-x>", cb = tree_cb("split") },
        { key = "t",     cb = tree_cb("tabnew") },
        { key = "<",     cb = tree_cb("prev_sibling") },
        { key = ">",     cb = tree_cb("next_sibling") },
        { key = "P",     cb = tree_cb("parent_node") },
        { key = "<BS>",  cb = tree_cb("close_node") },
        { key = "h",     cb = tree_cb("close_node") },
        { key = "<Tab>", cb = tree_cb("preview") },
        { key = "K",     cb = tree_cb("first_sibling") },
        { key = "J",     cb = tree_cb("last_sibling") },
        { key = "I",     cb = tree_cb("toggle_ignored") },
        { key = "H",     cb = tree_cb("toggle_dotfiles") },
        { key = "R",     cb = tree_cb("refresh") }, { key = "a", cb = tree_cb("create") },
        { key = "d",     cb = tree_cb("remove") }, { key = "r", cb = tree_cb("rename") },
        { key = "<C-r>", cb = tree_cb("full_rename") },
        { key = "x",     cb = tree_cb("cut") }, { key = "c", cb = tree_cb("copy") },
        { key = "p",  cb = tree_cb("paste") }, { key = "y", cb = tree_cb("copy_name") },
        { key = "Y",  cb = tree_cb("copy_path") },
        { key = "gy", cb = tree_cb("copy_absolute_path") },
        { key = "[c", cb = tree_cb("prev_git_item") },
        { key = "]c", cb = tree_cb("next_git_item") },
        { key = "-",  cb = tree_cb("dir_up") }, { key = "q", cb = tree_cb("close") },
        { key = "i",  cb = tree_cb("close") },
        { key = "g?", cb = tree_cb("toggle_help") }


      },
    },
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  experimental = {
    git = {
      async = true,
    },
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}
