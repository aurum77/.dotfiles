---@diagnostic disable: missing-fields
return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			local notify = require("notify")

			notify.setup({
				stages = "fade_in_slide_out",
				render = "compact",
				timeout = 2000,
				fps = 72,
				top_down = false,
				background_colour = "#282828",
				on_open = function(win)
					local config = vim.api.nvim_win_get_config(win)
					config.border = "single"
					vim.api.nvim_win_set_config(win, config)
				end,
			})

			-- Set as default notification system
			vim.notify = notify
		end,
	},
}
