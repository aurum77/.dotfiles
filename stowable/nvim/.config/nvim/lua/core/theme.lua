require("gruvbox").setup({
	italic = {
		strings = false,
		operators = false,
		comments = true,
	},
})

vim.cmd.colorscheme("gruvbox")

local gruvbox = require("gruvbox.palette").colors

vim.api.nvim_set_hl(0, "FidgetTask", { bg = gruvbox.dark0, fg = gruvbox.dark0 })
vim.api.nvim_set_hl(0, "FidgetTitle", { bg = gruvbox.dark0, fg = gruvbox.bright_yellow, bold = true })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = gruvbox.dark1, fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = gruvbox.dark1, fg = gruvbox.bright_yellow })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = gruvbox.bright_blue })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = gruvbox.bright_yellow, bold = true })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = gruvbox.light0 })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = gruvbox.light1 })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = gruvbox.dark1 })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = gruvbox.bright_orange })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = gruvbox.bright_orange })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = gruvbox.dark1, bold = true })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = gruvbox.dark1, fg = gruvbox.bright_orange, bold = true })
vim.api.nvim_set_hl(0, "TroubleFoldIcon", { bg = "NONE", fg = gruvbox.bright_yellow })
vim.api.nvim_set_hl(0, "TroubleSignError", { bg = "NONE", fg = gruvbox.bright_red })
vim.api.nvim_set_hl(0, "TroubleSignHint", { bg = "NONE", fg = gruvbox.bright_aqua })
vim.api.nvim_set_hl(0, "TroubleSignInformation", { bg = "NONE", fg = gruvbox.bright_aqua })
vim.api.nvim_set_hl(0, "TroubleSignOther", { bg = "NONE", fg = gruvbox.bright_blue })
vim.api.nvim_set_hl(0, "VertSplit", { fg = gruvbox.dark1 })
