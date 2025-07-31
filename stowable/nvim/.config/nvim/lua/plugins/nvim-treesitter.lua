return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = {
		"TSInstall",
		"TSUninstall",
		"TSInstallInfo",
		"TSUpdate",
		"TSBufEnable",
		"TSBufDisable",
		"TSEnable",
		"TSDisable",
		"TSModuleInfo",
		"TSToggle",
		"TSBufToggle",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			auto_install = true,
			sync_install = false,
		})
	end,
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
			},
		},
	},
	event = "BufEnter",
}
