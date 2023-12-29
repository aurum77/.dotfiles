local status_ok, notify = pcall(require, "notify")

if not status_ok then
	return
end

local banned_messages = { "No information available", "error drawing label for" }
vim.notify = function(msg, ...)
	for _, banned in ipairs(banned_messages) do
		if string.find(msg, banned) == nil then
			return
		end
	end
	return require("notify")(msg, ...)
end

notify.setup({
	fps = 72,
	level = 2,
	min_width = 50,
	render = "compact",
	stages = "fade_in_slide_out",
	background_color = "#282828",
	timeout = 4000,
	top_down = false,
})
