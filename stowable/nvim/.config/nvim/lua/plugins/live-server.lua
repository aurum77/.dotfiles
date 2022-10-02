local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
	return
end

live_server.setup({
	port = 7777,
	browser_command = "firefox",
  quiet = false,
	no_css_inject = true,
})
