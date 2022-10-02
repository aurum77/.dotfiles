local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"html-lsp",
		"css-lsp",
		"typescript-language-server",
		"clangd",
		"jedi-language-server",
		"json-lsp",
		"lua-language-server",
		"emmet-ls",
    "tailwindcss-language-server",
	},
	automatic_installation = true,
})
