local M = {}

local map = vim.keymap.set

function M.on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, bufopts)
	map("n", "<Leader>k", function()
		vim.lsp.buf.signature_help({ border = "single" })
	end, bufopts)
	map("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<Leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", bufopts)
	map("n", "gr", "<Cmd>Telescope lsp_references<CR>", bufopts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.keymap_opts = { silent = true }

return M
