-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- Redraw on start
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
		vim.defer_fn(function()
			vim.loop.kill(pid, WINCH)
		end, 20)
	end,
})

-- Don't draw cursorline if not focused
local cursor_highlight_group = vim.api.nvim_create_augroup("CursorHighlight", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "User TelescopeFindPre" }, {
	command = "lua vim.opt.cursorline = true",
	group = cursor_highlight_group,
})
vim.api.nvim_create_autocmd("WinLeave", {
	command = "lua vim.opt.cursorline = false",
	group = cursor_highlight_group,
})

-- Disable relative line numbers on focus leave and window focus
local change_line_number_style_group = vim.api.nvim_create_augroup("LineNumberStyle", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave", "User TelescopeFindPre" }, {
	command = "lua if not vim.opt.number['_value'] == false then vim.opt.relativenumber = true end",
	group = change_line_number_style_group,
})
vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
	command = "lua vim.opt.relativenumber = false",
	group = change_line_number_style_group,
})
vim.api.nvim_create_autocmd("FocusGained", {
	command = "lua if not vim.opt.number['_value'] == false then vim.opt.relativenumber = true end",
	group = change_line_number_style_group,
})
vim.api.nvim_create_autocmd("FocusLost", {
	command = "lua vim.opt.relativenumber = false",
	group = change_line_number_style_group,
})

local autoread_group = vim.api.nvim_create_augroup("AutoreadGroup", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	command = "checktime",
})

local sign_column_toggle_group = vim.api.nvim_create_augroup("SignColumnToggleGroup", { clear = true })
vim.api.nvim_create_autocmd("TermEnter", {
	command = "set signcolumn=no",
})
-- autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
local json_filetype_change_group = vim.api.nvim_create_augroup("JsonFiletypeChangeGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.json" },
	callback = function()
		vim.opt_local.filetype = "jsonc"
	end,
})

function _TOGGLE_BACKGROUND()
	if vim.api.nvim_get_option("background") == "dark" then
		vim.api.nvim_set_option("background", "light")
	elseif vim.api.nvim_get_option("background") == "light" then
		vim.api.nvim_set_option("background", "dark")
		vim.cmd([[
    source ~/.config/nvim/lua/core/colorscheme.lua
  ]])
	end
end
