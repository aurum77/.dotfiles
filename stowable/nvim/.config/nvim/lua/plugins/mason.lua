local lsp = require("plugins.lsp.utils").get_lsp()

return {
	{
		"mason-org/mason-lspconfig.nvim",
		init = function()
			vim.keymap.set("n", "<Leader>lm", "<Cmd>Mason<CR>", opts)
		end,
		opts = {
			ensure_installed = lsp,
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				config = function()
					require("mason").setup({
						ui = {
							icons = {
								package_installed = "✓",
								package_pending = "",
								package_uninstalled = "✗",
							},
							border = "single",
						},
					})
				end,
				cmd = {
					"Mason",
					"MasonInstall",
					"MasonUpdate",
					"MasonUninstall",
					"MasonUninstallAll",
					"MasonLog",
				},
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				config = function()
					require("mason-tool-installer").setup({
						ensure_installed = {
							"black",
							"clang-format",
							"jq",
							"prettier",
							"stylua",
							"shfmt",
						},
					})
				end,
			},
		},
	},
}
