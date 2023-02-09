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
  color_overrides = {

  }
})

vim.cmd.colorscheme("catppuccin-frappe")
