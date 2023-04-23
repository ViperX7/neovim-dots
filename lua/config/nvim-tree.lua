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
  on_attach = "default",
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
