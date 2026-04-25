vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" })

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
