local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  sync_root_with_cwd = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_directories = {
    enable = false,
  },
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = true,
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      symlink_arrow = "  ",
      padding = "  ",
      glyphs = {
        git = {
          untracked = "留",
        },
      },
    },
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  view = {
    adaptive_size = true,
    -- width = 40,
    -- height = 30,
    side = "left",
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = true,
        chars = "HJKLASDF",
      }
    }
  }
}
