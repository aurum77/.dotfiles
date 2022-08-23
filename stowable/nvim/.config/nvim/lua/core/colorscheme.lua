local status_ok, gruvbox = pcall(require, "gruvbox")

if not status_ok then
	return
end

gruvbox.setup({
	contrast = "hard",
	italic = true,
})

vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_set_hl(0, "SneakScope", { fg = "#8EC07C", bg = "#282828" })
vim.api.nvim_set_hl(0, "SneakLabel", { fg = "#8EC07C", bg = "#504945", bold = true })
vim.api.nvim_set_hl(0, "SneakLabelMask", {})
vim.api.nvim_set_hl(0, "PMenu", { bg = NONE })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#928374" })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#fe8019" })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = "#fbf1c7" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#3c3836", bold = true })
