local status_ok, mason = pcall(require, "mason")

if not status_ok then
	return
end

mason.setup({
	ui = {
		border = "single",
		icons = {
			package_installed = "✓",
			package_pending = "o",
			package_uninstalled = "✗",
		},
	},
})
