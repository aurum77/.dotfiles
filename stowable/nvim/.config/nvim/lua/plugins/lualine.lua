local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

local colors = require("core.colors").palette

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 120
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
			return ""
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return ""
	end,
	-- cond = conditions.hide_in_width,
}

local filesize = {
	"filesize",
	fmt = string.upper,
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = false,
}

local filename = {
	"filename",
	path = 1,
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
	-- cond = conditions.hide_in_width,
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
	-- cond = conditions.hide_in_width,
}

local branch = {
	"branch",
	icon = "",
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		component_separators = "",
		section_separators = "",
		theme = {
			normal = {
				a = { bg = colors.bg1, fg = colors.fg },
				b = { bg = colors.bg1, fg = colors.fg },
				c = { bg = colors.bg1, fg = colors.fg },
				x = { bg = colors.bg1, fg = colors.fg },
				y = { bg = colors.bg1, fg = colors.fg },
				z = { bg = colors.bg1, fg = colors.fg },
			},
		},
	},
	sections = {
		lualine_a = { branch, filesize, diff, diagnostics },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { encoding, fileformat, lsp, "progress", "location" },
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
