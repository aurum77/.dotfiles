local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"html",
		"cssls",
		"tsserver",
		"clangd",
		"jedi_language_server",
		"jsonls",
		"sumneko_lua",
    "tailwindcss",
    "csharp_ls",
	},
	automatic_installation = true,
})
