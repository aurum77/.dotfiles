local frappe = require("catppuccin.palettes").get_palette("frappe")

require("catppuccin").setup({
	background = {
		light = "latte",
		dark = "frappe",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	highlight_overrides = {
		all = function(colors)
			return {
				NvimTreeNormal = { bg = colors.none },
				VertSplit = { fg = frappe.surface0, bg = colors.none },
				NvimTreeSplit = { fg = frappe.surface0, bg = colors.none },
			}
		end,
	},
})

vim.cmd.colorscheme("catppuccin-frappe")
