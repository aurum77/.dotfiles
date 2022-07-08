local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local fileformat = {
  "fileformat",
  icons_enabled = false
}

local filename = {
  "filename",
  symbols = {
    modified = ' ',
    readonly = ' '
  },
}

local diagnostics = {
  "diagnostics",
  update_in_insert = true,
  always_visible = true
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "gruvbox-baby",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", diagnostics },
    lualine_c = { "%=", filename },
    lualine_x = { fileformat, "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
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
