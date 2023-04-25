local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

local gruvbox = require("gruvbox.palette").colors

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 100
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local lsp = {
	function()
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return "no ls"
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return ""
	end,
	cond = conditions.hide_in_width,
}

local filesize = {
	"filesize",
	fmt = string.upper,
}

local filetype = {
	"filetype",
	icon_only = false,
	colored = false,
}

local filename = {
	"filename",
	path = 0,
	symbols = {
		modified = " ",
		readonly = " ",
	},
	cond = conditions.buffer_not_empty,
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	-- cond = conditions.hide_in_width,
}

local diagnostics = {
	"diagnostics",
	update_in_insert = true,
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local encoding = {
	"encoding",
	fmt = string.upper,
	cond = conditions.hide_in_width,
}

local fileformat = {
	"fileformat",
	icons_enabled = true,
	fmt = string.upper,
	symbols = {
		unix = "LF",
		dos = "CRLF",
		mac = "CR",
	},
	cond = conditions.hide_in_width,
}

local branch = {
	"branch",
	icon = "",
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		section_separators = "",
		component_separators = "",
		-- theme = {
		-- 	normal = {
		-- 		a = { bg = gruvbox.dark1, fg = gruvbox.light1 },
		-- 		b = { bg = gruvbox.dark0, fg = gruvbox.light1 },
		-- 		c = { bg = gruvbox.dark0, fg = gruvbox.light1 },
		-- 		x = { bg = gruvbox.dark0, fg = gruvbox.light1 },
		-- 		y = { bg = gruvbox.dark0, fg = gruvbox.light1 },
		-- 		z = { bg = gruvbox.dark1, fg = gruvbox.light1 },
		-- 	},
		-- },
		theme = "auto",
	},
	sections = {
		-- filetype,
		lualine_a = {"mode" },
		lualine_b = { branch },
		lualine_c = { diagnostics },
		lualine_x = { diff, fileformat },
		lualine_y = { "progress", lsp },
		lualine_z = { filetype, "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "nvim-tree", "toggleterm" },
})
