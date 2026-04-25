vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })

vim.keymap.set("n", "<Leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", { silent = true })
vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "single" })
end, { silent = true })
vim.keymap.set("n", "<Leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { silent = true })
vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, { silent = true })
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { silent = true })
vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", { silent = true })
vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>", { silent = true })

require("mason-lspconfig").setup({
	ensure_installed = {
		"basedpyright",
		"bashls",
		"cssls",
		"docker_compose_language_service",
		"dockerls",
		"eslint",
		"gopls",
		"html",
		"jsonls",
		"lua_ls",
		"tailwindcss",
		"ts_ls",
	},
})
