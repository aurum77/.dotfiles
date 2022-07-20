local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local mode = {
  "mode",
  fmt = function(str) return str:sub(1, 1) end,
}

local diagnostics = {
  "diagnostics",
  update_in_insert = true,
}


local filetype = {
  "filetype",
  icon_only = true
}

local fileformat = {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = false,
    theme = "gruvbox",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch", "diff", diagnostics },
    lualine_c = { "%=", "filename"},
    lualine_x = { filetype},
    lualine_y = { "progress" },
    lualine_z = { fileformat }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { "nvim-tree" },
}
