local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
	return
end

toggleterm.setup({
	shade_terminals = false,
	direction = "float",
	autochdir = true,
	float_opts = {
		border = "rounded",
	},
})
