local status_ok, barbecue = pcall(require, "barbecue")

if not status_ok then
	return
end

barbecue.setup({
	create_autocmd = true,
	show_modified = true,
	exclude_filetypes = { "toggleterm", "NvimTree" },
})
