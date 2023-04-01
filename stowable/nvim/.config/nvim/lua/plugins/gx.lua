local status_ok, gx = pcall(require, "gx")

if not status_ok then
	return
end

gx.setup({
	open_browser_app = "xdg-open",
	handlers = {
		plugin = true,
		github = true,
	},
})
