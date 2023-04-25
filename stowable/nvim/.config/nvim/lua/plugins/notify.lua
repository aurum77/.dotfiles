local status_ok, notify = pcall(require, "notify")

if not status_ok then
	return
end

vim.notify = require("notify")

notify.setup({
	fps = 72,
	level = 2,
	minimum_width = 50,
	render = "default",
	stages = "fade_in_slide_out",
	timeout = 4000,
	top_down = true,
})
