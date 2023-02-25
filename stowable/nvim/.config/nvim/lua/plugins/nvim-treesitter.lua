local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

configs.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	auto_install = true,
})
