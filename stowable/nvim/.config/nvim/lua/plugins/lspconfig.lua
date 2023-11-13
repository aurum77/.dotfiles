local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

require("lspconfig.ui.windows").default_options.border = "rounded"

local utils = require("core.utils")

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
}) }

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
})

lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
})

lspconfig.jedi_language_server.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
})

-- lspconfig.gdscript.setup({
-- 	capabilities = capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = handlers
-- })

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
})

-- lspconfig.prismals.setup({
-- 	capabilities = capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = handlers,
-- })

-- lspconfig.dartls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = handlers
-- })

lspconfig.omnisharp.setup({
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		}),
	},
	capabilities = capabilities,
	on_attach = utils.on_attach,
	enable_import_completion = true,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
	filetypes = {
		"html",
	},
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = utils.on_attach,
	handlers = handlers,
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
	on_attach = utils.on_attach,
	handlers = handlers,
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
	on_attach = utils.on_attach,
	handlers = handlers,
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

-- lspconfig.clangd.setup({
-- 	capabilities = capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = handlers
-- })

-- lspconfig.gopls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = handlers
-- })
