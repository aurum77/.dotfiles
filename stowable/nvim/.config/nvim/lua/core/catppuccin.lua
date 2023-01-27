require("catppuccin").setup({
	background = {
		light = "latte",
		dark = "frappe",
	},
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
})

vim.cmd.colorscheme("catppuccin-frappe")
