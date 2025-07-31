return {
	"tanvirtin/vgit.nvim",
  enabled = false,
	init = function()
		local opts = require("plugins.lsp.opts").opts
		vim.keymap.set("n", "<Leader>td", "<Cmd>VGit buffer_diff_preview<CR>", opts)
	end,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	opts = {
		settings = {
			hls = {
				GitAppBar = "GruvboxFg0",
				GitHeader = "GruvboxFg0",
			},
			scene = {
				diff_preference = "unified", -- unified or split
				keymaps = {
					quit = "q",
				},
			},
		},
	},
}
