local M = {}

function M.toggle_theme()
	if vim.opt.background._value == "dark" then
		vim.opt.background = "light"
	else
    vim.opt.background = "dark"
    vim.cmd("so " .. vim.fn.stdpath("config") .. "/lua/core/theme.lua")
	end
end

return M
