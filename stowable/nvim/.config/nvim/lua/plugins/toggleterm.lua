return {
	"akinsho/toggleterm.nvim",
	cmd = {
		"ToggleTerm",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
	},
	init = function()
		local opts = require("plugins.lsp.opts").opts
		vim.keymap.set({ "n", "t", "i" }, "<C-t>", "<Cmd>ToggleTerm<CR>", opts)
		vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "fd", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-l>", "<C-l>", opts)
	end,
	opts = {
		shade_terminals = false,
		hide_numbers = true,
		close_on_exit = true,
		direction = "float",
		autochdir = true,
		float_opts = {
			border = "single",
		},
	},
}
