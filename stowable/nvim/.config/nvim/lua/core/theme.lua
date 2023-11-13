local M = {}

local gruvbox = require("gruvbox").palette

function M.setup_theme()
	require("gruvbox").setup({
		italic = {
			strings = false,
			operators = false,
			comments = true,
		},
	})

	vim.cmd.colorscheme("gruvbox")
end

function M.override_highlights()
	if vim.opt.background._value == "dark" then
		-- Internal
		vim.api.nvim_set_hl(0, "VertSplit", { fg = gruvbox.dark1 })
		vim.api.nvim_set_hl(0, "SignColumn", { fg = gruvbox.dark0 })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = gruvbox.dark0, fg = gruvbox.light1 })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = gruvbox.dark0, fg = gruvbox.light1 })
		-- Internal
		-- Gitsigns
		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = gruvbox.bright_blue })
		-- Gitsigns
		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = gruvbox.bright_yellow, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = gruvbox.bright_orange, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = gruvbox.light0 })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = gruvbox.dark0 })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = gruvbox.dark0 })
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
		vim.api.nvim_set_hl(
			0,
			"TreesitterContextLineNumber",
			{ bg = gruvbox.dark1, fg = gruvbox.bright_orange, bold = true }
		)
		-- TreesitterContext
		-- Trouble
		vim.api.nvim_set_hl(0, "TroubleFoldIcon", { bg = "NONE", fg = gruvbox.bright_yellow })
		vim.api.nvim_set_hl(0, "TroubleSignError", { bg = "NONE", fg = gruvbox.bright_red })
		vim.api.nvim_set_hl(0, "TroubleSignHint", { bg = "NONE", fg = gruvbox.bright_aqua })
		vim.api.nvim_set_hl(0, "TroubleSignInformation", { bg = "NONE", fg = gruvbox.bright_aqua })
		vim.api.nvim_set_hl(0, "TroubleSignOther", { bg = "NONE", fg = gruvbox.bright_blue })
		-- Trouble
	else
		-- Internal
		vim.api.nvim_set_hl(0, "VertSplit", { fg = gruvbox.light1 })
		vim.api.nvim_set_hl(0, "SignColumn", { fg = gruvbox.light0 })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = gruvbox.light0, fg = gruvbox.dark1 })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = gruvbox.light0, fg = gruvbox.dark1 })
		-- Internal
		-- TreesitterContext
		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = gruvbox.light1, bold = true })
		vim.api.nvim_set_hl(
			0,
			"TreesitterContextLineNumber",
			{ bg = gruvbox.light1, fg = gruvbox.bright_orange, bold = true }
		)
		-- TreesitterContext
	end
end

return M
