return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local gruvbox = require("gruvbox").palette

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
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
				local clients = vim.lsp.get_clients()
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
			cond = conditions.hide_in_width,
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = false,
		}

		local filename = {
			"filename",
			path = 0,
			symbols = {
				modified = "",
				readonly = " ",
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
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
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
			icon = " ",
		}

		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				theme = {
					normal = {
						a = { bg = gruvbox.dark1, fg = gruvbox.light0 },
						b = { bg = gruvbox.dark1, fg = gruvbox.light2 },
						c = { bg = gruvbox.dark1, fg = gruvbox.light3 },
						x = { bg = gruvbox.dark1, fg = gruvbox.light3 },
						y = { bg = gruvbox.dark1, fg = gruvbox.light2 },
						z = { bg = gruvbox.dark1, fg = gruvbox.light0 },
					},
				},
			},
			sections = {
				lualine_a = { filename },
				lualine_b = { branch },
				lualine_c = { diagnostics },
				lualine_x = { diff, fileformat },
				lualine_y = { "progress", lsp },
				lualine_z = { "location" },
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
	end,
}
