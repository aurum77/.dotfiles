local status_ok, auto_dark_mode = pcall(require, "auto-dark-mode")

if not status_ok then
	return
end

auto_dark_mode.setup({
	update_interval = 100,
	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme gruvbox")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option("background", "light")
		vim.cmd("colorscheme gruvbox")
	end,
})
