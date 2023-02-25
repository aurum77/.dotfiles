local status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")

if not status_ok then
	return
end

mason_tool_installer.setup({
	ensure_installed = {
		"prettier",
		"clang-format",
		"black",
		"stylua",
		"jq",
    "shfmt"
	},
})
