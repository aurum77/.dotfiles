local timer = vim.loop.new_timer()
local theme = require("core.theme")
local nvim_tree_api = require("nvim-tree.api")

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- Don't draw cursorline if not focused
local cursor_highlight_group = vim.api.nvim_create_augroup("CursorHighlight", { clear = true })
vim.api.nvim_create_autocmd({
	"BufEnter",
	"WinEnter", --[["User TelescopeFindPre"]]
}, {
	callback = function()
		vim.opt.cursorline = true
	end,
	group = cursor_highlight_group,
})
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
	callback = function()
		vim.opt.cursorline = false
	end,
	group = cursor_highlight_group,
})

-- Disable relative line numbers on focus leave and window focus
local change_line_number_style_group = vim.api.nvim_create_augroup("LineNumberStyle", { clear = true })
vim.api.nvim_create_autocmd({
	"WinEnter",
	"InsertLeave",
	"FocusGained",
}, {
	callback = function()
		if not vim.opt.number["_value"] == false then
			vim.opt.relativenumber = true
		end
	end,
	group = change_line_number_style_group,
})
vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter", "FocusLost" }, {
	callback = function()
		vim.opt.relativenumber = false
	end,
	group = change_line_number_style_group,
})
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopeFindPre",
	callback = function()
		if not vim.opt.number["_value"] == false then
			vim.opt.relativenumber = true
		end
	end,
	group = change_line_number_style_group,
})

local autoread_group = vim.api.nvim_create_augroup("AutoreadGroup", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	command = "checktime",
	group = autoread_group,
})

local sign_column_toggle_group = vim.api.nvim_create_augroup("SignColumnToggleGroup", { clear = true })
vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		vim.opt.signcolumn = "no"
	end,
	group = sign_column_toggle_group,
})
-- autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
local json_filetype_change_group = vim.api.nvim_create_augroup("JsonFiletypeChangeGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.json" },
	callback = function()
		vim.opt_local.filetype = "jsonc"
	end,
	group = json_filetype_change_group,
})

local open_nvim_tree_group = vim.api.nvim_create_augroup("OpenNvimTreeGroup", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not no_name and not directory then
			return
		end

		-- change to the directory
		if directory then
			vim.cmd.cd(data.file)
		end

		-- open the tree
		nvim_tree_api.tree.open()
	end,
	group = open_nvim_tree_group,
})

local colorscheme_hook = vim.api.nvim_create_augroup("ColorschemeHook", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		theme.override_highlights()
	end,
	group = colorscheme_hook,
})

local startup_colorscheme_hook = vim.api.nvim_create_augroup("StartupColorschemeHook", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- fix colorscheme
		timer:start(
			0,
			0,
			vim.schedule_wrap(function()
				theme.setup_theme()
				theme.override_highlights()
			end)
		)
	end,
	group = startup_colorscheme_hook,
})
