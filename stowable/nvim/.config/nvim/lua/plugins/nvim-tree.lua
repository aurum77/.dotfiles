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
  disable_netrw = true,
  hijack_netrw = true,
  sync_root_with_cwd = true,
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  filters = {
    dotfiles = true,
  },
  hijack_directories = {
    enable = false,
  },
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = false,
  renderer = {
    root_folder_modifier = ":t",
    symlink_destination = false,
    icons = {
      webdev_colors = true,
      show = {
        folder = true,
        file = true,
        git = true,
      },
      padding = " ",
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      }
    },
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        none = " ",
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
        { key = "d", cb = tree_cb "trash" },
        { key = "D", cb = tree_cb "remove" },
        -- { key = "c", cb = tree_cb "cut" },
        -- { key = "p", cb = tree_cb "paste" },
        { key = "f", action = "" },
        { key = "<C-t>", action = "" },
      },
    },
  },
  diagnostics = {
    icons = {
      error = "",
      warning = "",
      hint = "",
      info = "",
    },

    enable = true,
    show_on_dirs = true,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = true,
        chars = "JKLASDF",
      },
    },
  },
}
