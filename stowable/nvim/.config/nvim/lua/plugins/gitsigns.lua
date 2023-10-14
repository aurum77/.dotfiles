local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
	return
end

gitsigns.setup({
	preview_config = {
		border = "none",
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local keymap_opts = require("core.utils").keymap_opts
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", keymap_opts)
		map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", keymap_opts)
		map("n", "<leader>hS", gs.stage_buffer, keymap_opts)
		map("n", "<leader>hu", gs.undo_stage_hunk, keymap_opts)
		map("n", "<leader>hR", gs.reset_buffer, keymap_opts)
		map("n", "<leader>hp", gs.preview_hunk, keymap_opts)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, keymap_opts)
		map("n", "<leader>tb", gs.toggle_current_line_blame, keymap_opts)
		map("n", "<leader>hd", gs.diffthis, keymap_opts)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end, keymap_opts)
		map("n", "<leader>td", gs.toggle_deleted, keymap_opts)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", keymap_opts)
	end,
})
