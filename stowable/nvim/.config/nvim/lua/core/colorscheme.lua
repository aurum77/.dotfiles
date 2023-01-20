require("gruvbox").setup({
	italic = false,
})

vim.cmd.colorscheme("gruvbox")

local colors = require("core.colors").palette

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = colors.bg1 })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = colors.fg })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.ltorange })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = colors.fg0 })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.ltyellow, bold = true })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.bg1, bold = true })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = colors.bg1, fg = colors.ltorange, bold = true })
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { bg = colors.aqua, fg = colors.bg0, bold = true })
vim.api.nvim_set_hl(0, "LeapLabelSecondary", { bg = colors.blue, fg = colors.bg0, bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.bg1 })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = colors.ltblue })
vim.api.nvim_set_hl(0, "TroubleFoldIcon", { bg = "NONE", fg = colors.ltyellow })
vim.api.nvim_set_hl(0, "TroubleSignError", { bg = "NONE", fg = colors.ltred })
vim.api.nvim_set_hl(0, "TroubleSignOther", { bg = "NONE", fg = colors.ltblue })
vim.api.nvim_set_hl(0, "TroubleSignInformation", { bg = "NONE", fg = colors.ltaqua })
vim.api.nvim_set_hl(0, "TroubleSignHint", { bg = "NONE", fg = colors.ltaqua })
vim.api.nvim_set_hl(0, "markdownBoldItalic", { bg = "NONE", fg = colors.ltorange, bold = true })
vim.api.nvim_set_hl(0, "FidgetTitle", { bg = colors.bg1, fg = colors.ltyellow, bold = true })
vim.api.nvim_set_hl(0, "FidgetTask", { bg = colors.bg1, fg = colors.fg })
