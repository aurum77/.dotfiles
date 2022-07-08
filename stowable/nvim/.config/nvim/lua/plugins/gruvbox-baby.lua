local status_ok, gruvbox = pcall(require, "gruvbox-baby")
if not status_ok then
  return
end

local colors = require("gruvbox-baby.colors").config()

vim.g.gruvbox_baby_transparent_mode = 1

vim.g.gruvbox_baby_highlights = {
  CursorLineNr = { fg = colors.bright_yellow, bg = "NONE", style = "bold" },
  LineNrAbove = { fg = colors.comment, bg = "NONE", style = "NONE" },
  LineNrBelow = { fg = colors.comment, bg = "NONE", style = "NONE" },
  IncSearch = { fg = colors.bright_yellow, bg = colors.background, style = "inverse" },
  Search = { fg = colors.bright_yellow, bg = colors.background, style = "inverse" },
  Visual = { fg = "NONE", bg = colors.medium_gray, style = "NONE" },
  PmenuSel = { fg = colors.bg, bg = colors.medium_gray, style = "NONE" }
}
