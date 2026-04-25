vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	preview_config = {
		border = "single",
	},
	current_line_blame = true,
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		-- Navigation
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { silent = true })
		vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { silent = true })
		vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { silent = true })
		vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { silent = true })
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { silent = true })
		vim.keymap.set("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, { silent = true })
		vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { silent = true })
		vim.keymap.set("n", "<leader>hd", gs.diffthis, { silent = true })
		vim.keymap.set("n", "<leader>hD", function()
			gs.diffthis("~")
		end, { silent = true })
		vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { silent = true })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { silent = true })
	end,
})
