local status_ok, fidget = pcall(require, "fidget")

if not status_ok then
	return
end

fidget.setup({
	text = {
		spinner = "line",
		done = "",
	},
	align = {
		bottom = true,
	},
	window = {
		relative = "editor",
		blend = 0,
	},
	fmt = {
		-- function to format fidget title
		fidget = function(fidget_name, spinner)
			return string.format("%s %s", spinner, fidget_name)
		end,
		-- function to format each task line
		task = function(task_name, message, percentage)
			return ""
		end,
	},
})
