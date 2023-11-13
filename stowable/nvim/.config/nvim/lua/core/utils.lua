local M = {}

local map = vim.keymap.set

function M.toggle_theme()
	if vim.opt.background._value == "dark" then
		vim.opt.background = "light"
	else
		vim.opt.background = "dark"
	end
  vim.cmd("so " .. vim.fn.stdpath("config") .. "/lua/core/theme.lua")
end

function M.on_attach(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	if client.name == "omnisharp" then
		map("n", "gd", "<Cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", bufopts)
	else
		map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
	end

	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts)
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
	map("n", "<Leader>fa", "<Cmd>TroubleToggle<CR>", bufopts)
	map("n", "<Leader>fd", "<Cmd>TroubleToggle document_diagnostics<CR>", bufopts)
end

M.keymap_opts = { silent = true }

return M
