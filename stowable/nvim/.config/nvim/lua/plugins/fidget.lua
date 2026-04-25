vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })

require("fidget").setup({
	progress = {
		display = {
			progress_icon = { "dots" },
			done_icon = "",
		},
	},
	notification = {
		window = {
			relative = "editor",
			winblend = 0,
			align = "bottom",
		},
	},
})
