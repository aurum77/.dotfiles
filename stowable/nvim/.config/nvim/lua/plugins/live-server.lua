return {
	"aurum77/live-server.nvim",
	opts = {
		port = 7777,
		browser_command = "firefox",
		quiet = false,
		no_css_inject = true,
	},
	cmd = {
		"LiveServer",
		"LiveServerStart",
		"LiveServerStop",
		"LiveServerInstall",
	},
	build = function()
		require("live_server.util").install()
	end,
}
