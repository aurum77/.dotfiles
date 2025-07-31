return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		vim.cmd.colorscheme("gruvbox")
		require("core.theme")
	end,
	lazy = false,
}
