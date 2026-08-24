return {

	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	init = function()
		require("nvim-treesitter").install({
			"bash",
			"css",
			"dockerfile",
			"go",
			"html",
			"javascript",
			"jsx",
			"lua",
			"markdown",
			"tsx",
			"typescript",
			"yaml",
			"c_sharp",
		})
	end,
}
