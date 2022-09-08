local status_ok, dracula = pcall(require, "dracula")

if not status_ok then
	return
end

dracula.setup({
	transparent_bg = true,
	italic_comment = true,
})

vim.cmd([[colorscheme dracula]])

vim.api.nvim_set_hl(0, "SneakScope", { fg = dracula.colors().bright_yellow, bg = dracula.colors().bg })
vim.api.nvim_set_hl(
	0,
	"SneakLabel",
	{ fg = dracula.colors().bright_yellow, bg = dracula.colors().selection, bold = true }
)
vim.api.nvim_set_hl(0, "SneakLabelMask", {})
vim.api.nvim_set_hl(0, "PMenuSel", { fg = dracula.colors().bg, bg = dracula.colors().purple })
vim.api.nvim_set_hl(0, "VertSplit", { fg = dracula.colors().selection })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = dracula.colors().selection })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = dracula.colors().purple })
vim.api.nvim_set_hl(0, "FidgetTask", { fg = dracula.colors().comment, bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = dracula.colors().selection })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = dracula.colors().comment })
