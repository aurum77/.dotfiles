local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter_configs.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	auto_install = true,
	sync_install = false,
	ensure_installed = {},
	ignore_install = {},
	modules = {},
})
