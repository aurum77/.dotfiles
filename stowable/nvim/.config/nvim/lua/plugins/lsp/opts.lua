local M = {}

function M.on_attach(client, bufnr)
	local opts = { silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<Leader>k", function()
		vim.lsp.buf.signature_help({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<Leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)
	vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.opts = { silent = true }

return M
