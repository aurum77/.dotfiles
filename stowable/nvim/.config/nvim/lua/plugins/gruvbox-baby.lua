local status_ok, gruvbox = pcall(require, "gruvbox-baby")
if not status_ok then
  return
end

local colors = require("gruvbox-baby.colors").config()

vim.g.gruvbox_baby_transparent_mode = 1

vim.g.gruvbox_baby_highlights = {
  CursorLineNr = { fg = colors.bright_yellow, bg = colors.bg_light, style = "bold" },
  LineNrAbove = { fg = colors.comment, bg = "NONE", style = "NONE" },
  LineNrBelow = { fg = colors.comment, bg = "NONE", style = "NONE" },
  TreesitterContext = { fg = "NONE", bg = colors.bg_light, style = "NONE" },
  TreesitterContextLineNumber = { fg = "NONE", bg = colors.bg_light, style = "NONE" },
  IncSearch = { fg = colors.bright_yellow, bg = colors.background, style = "inverse" },
  Search = { fg = colors.bright_yellow, bg = colors.background, style = "inverse" },
  Visual = { fg = "NONE", bg = colors.medium_gray, style = "NONE" },
  Pmenu = { fg = colors.foreground, bg = "NONE", style = "NONE" },
  PmenuSel = { fg = colors.bg, bg = colors.medium_gray, style = "NONE" },
  WinSeparator = { fg = colors.medium_gray, bg = "NONE" },
  NvimTreeWinSeparator = { fg = colors.medium_gray, bg = "NONE" },
  QuickFixLine = { fg = "NONE", bg = colors.medium_gray },
  SneakLabel = { fg = colors.bright_yellow, bg = colors.medium_gray, bold = true },
  TelescopePromptPrefix = { fg = colors.light_blue, bg = "NONE", bold = true },
  TelescopeSelectionCaret = { fg = colors.light_blue, bg = colors.medium_gray, bold = true },
  TelescopePromptCounter = { fg = colors.foreground, bg = colors.bg_light, bold = true },
}
