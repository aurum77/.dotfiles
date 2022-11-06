local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"javascript",
		"lua",
		"markdown",
		"python",
		"typescript",
		"c",
		"cpp",
		"html",
		"css",
		"http",
		"json",
		"jsonc",
		"bash",
		"tsx",
		"c_sharp",
	},
	highlight = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
})
