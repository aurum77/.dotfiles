return {
	"nvim-telescope/telescope.nvim",
  lazy = false,
	init = function()
		local opts = require("plugins.lsp.opts").opts
		vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", opts)
		vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
		vim.keymap.set("n", "<Leader>f.", "<Cmd>Telescope live_grep hidden=true<CR>", opts)
		vim.keymap.set("n", "<Leader>f;", "<Cmd>Telescope commands<CR>", opts)
		vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", opts)
		vim.keymap.set("n", "<Leader>fk", "<Cmd>Telescope keymaps<CR>", opts)
		vim.keymap.set("n", "<Leader><Leader>", "<Cmd>Telescope buffers<CR>", opts)
	end,
	cmd = "Telescope",
	opts = {
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
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	},
}
