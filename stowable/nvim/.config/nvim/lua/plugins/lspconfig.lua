local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

-- require("lspconfig.ui.windows").default_options.border = "single"

local map = vim.keymap.set

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
	map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", bufopts)
	map("n", "gr", "<Cmd>Telescope lsp_references<CR>", bufopts)
	map("n", "<Leader>fa", "<Cmd>TroubleToggle<CR>", bufopts)
	map("n", "<Leader>fd", "<Cmd>TroubleToggle document_diagnostics<CR>", bufopts)
end

lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.jedi_language_server.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig.gdscript.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.prismals.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"html",
	},
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		css = {
			lint = {
				-- Don't error out when using tailwind
				unknownAtRules = "ignore",
			},
		},
	},
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.omnisharp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
  enable_import_completion = true,
})

lspconfig.dartls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.phpactor.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig.clangd.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- lspconfig.csharp_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- lspconfig.gopls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
