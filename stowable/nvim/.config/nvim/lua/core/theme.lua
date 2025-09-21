local M = {}

local gruvbox = require("gruvbox").palette

require("gruvbox").setup({
	italic = {
		strings = false,
		operators = false,
		comments = false,
	},
	transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")

-- Internal
vim.api.nvim_set_hl(0, "WinSeparator", { fg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "SignColumn", { fg = gruvbox.dark0 })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "Directory", { bg = "NONE", fg = gruvbox.bright_blue, bold = true })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = gruvbox.dark1 })
-- Internal
-- Gitsigns
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = gruvbox.bright_blue })
-- Gitsigns
-- Telescope
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = gruvbox.bright_yellow, bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = gruvbox.bright_orange, bold = true })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = gruvbox.light0 })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = gruvbox.light0 })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = gruvbox.light0 })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "NONE", fg = gruvbox.bright_orange })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = gruvbox.light0 })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = gruvbox.bright_orange })
-- Telescope
-- TreesitterContext
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = gruvbox.dark1, bold = true })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = gruvbox.dark1, fg = gruvbox.bright_yellow, bold = true })
-- TreesitterContext
-- Trouble
vim.api.nvim_set_hl(0, "TroubleFoldIcon", { bg = "NONE", fg = gruvbox.bright_yellow })
vim.api.nvim_set_hl(0, "TroubleSignError", { bg = "NONE", fg = gruvbox.bright_red })
vim.api.nvim_set_hl(0, "TroubleSignHint", { bg = "NONE", fg = gruvbox.bright_aqua })
vim.api.nvim_set_hl(0, "TroubleSignInformation", { bg = "NONE", fg = gruvbox.bright_aqua })
vim.api.nvim_set_hl(0, "TroubleSignOther", { bg = "NONE", fg = gruvbox.bright_blue })
-- Trouble
-- nvim.tree
vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", { bg = gruvbox.neutral_blue, fg = gruvbox.dark0 })
-- nvim.tree
return M
