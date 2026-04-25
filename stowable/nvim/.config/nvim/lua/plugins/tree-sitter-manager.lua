vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

require("tree-sitter-manager").setup({
	border = "single",
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"dockerfile",
		"ecma",
		"go",
		"html_tags",
		"javascript",
		"json",
		"jsx",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"tmux",
		"tsx",
		"typescript",
		"vimdoc",
		"yaml",
	},
	highlight = true,
})
