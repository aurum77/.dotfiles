return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		local opts = require("plugins.lsp.opts")

		require("flutter-tools").setup({
			ui = {
				border = "single",
			},
			dev_tools = {
				auto_open_browser = true,
			},
			lsp = {
				capabilities = opts.capabilities,
			},
		})
	end,
}
