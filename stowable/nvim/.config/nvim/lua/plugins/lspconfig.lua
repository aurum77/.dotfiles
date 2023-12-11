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

lspconfig.jsonls.setup({
	capabilities = utils.capabilities,
	handlers = utils.handlers,
	on_attach = utils.on_attach,
})

lspconfig.bashls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	handlers = utils.handlers,
})

lspconfig.tailwindcss.setup({
	capabilities = utils.capabilities,
	handlers = utils.handlers,
	on_attach = utils.on_attach,
})

lspconfig.jedi_language_server.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	handlers = utils.handlers,
})

-- lspconfig.gdscript.setup({
-- 	capabilities = utils.capabilities,
-- 	handlers = utils.handlers
-- 	on_attach = utils.on_attach,
-- })

lspconfig.html.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	handlers = utils.handlers,
})

-- lspconfig.prismals.setup({
-- 	capabilities = utils.capabilities,
-- 	handlers = utils.handlers,
-- 	on_attach = utils.on_attach,
-- })

-- lspconfig.dartls.setup({
-- 	capabilities = utils.capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = utils.handlers
-- })

lspconfig.omnisharp.setup({
	capabilities = utils.capabilities,
	on_attach = utils.omnisharp_on_attach,
	handlers = utils.omnisharp_handlers,
	enable_import_completion = true,
})

lspconfig.emmet_ls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	handlers = utils.handlers,
	filetypes = {
		"html",
	},
})

lspconfig.cssls.setup({
	capabilities = utils.capabilities,
	handlers = utils.handlers,
	on_attach = utils.on_attach,
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
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	handlers = utils.handlers,
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
	capabilities = utils.capabilities,
	handlers = utils.handlers,
	on_attach = utils.on_attach,
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
-- 	capabilities = utils.capabilities,
-- 	handlers = utils.handlers
-- 	on_attach = utils.on_attach,
-- })

-- lspconfig.gopls.setup({
-- 	capabilities = utils.capabilities,
-- 	on_attach = utils.on_attach,
-- 	handlers = utils.handlers
-- })
