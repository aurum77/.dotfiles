local status_ok, flutter_tools = pcall(require, "flutter-tools")

if not status_ok then
	return
end

local utils = require("core.utils")

flutter_tools.setup({
	lsp = {
		on_attach = utils.on_attach,
	},
})
