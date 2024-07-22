local status_ok, dressing = pcall(require, "dressing")

if not status_ok then
	return
end

dressing.setup({
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
