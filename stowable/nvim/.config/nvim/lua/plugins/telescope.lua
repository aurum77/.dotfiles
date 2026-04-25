vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>f.", "<Cmd>Telescope live_grep hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>f;", "<Cmd>Telescope commands<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fk", "<Cmd>Telescope keymaps<CR>", { silent = true })
vim.keymap.set("n", "<Leader><Leader>", "<Cmd>Telescope buffers<CR>", { silent = true })

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"^bin$",
			"^obj$",
		},
		selection_caret = "  ",
		prompt_prefix = " 󰭎  ",
		layout_config = {
			horizontal = { prompt_position = "bottom", results_width = 0.6 },
		},
		border = true,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
})
