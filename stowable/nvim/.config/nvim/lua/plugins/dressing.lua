vim.pack.add({ "https://github.com/stevearc/dressing.nvim" })

require("dressing").setup({
	input = {
		enabled = true,
		border = "single",
		relative = "editor",
		win_options = {
			winblend = 0,
			wrap = false,
		},
	},
	select = {
		telescope = require("telescope.themes").get_dropdown({
			border = true,
		}),
	},
})
