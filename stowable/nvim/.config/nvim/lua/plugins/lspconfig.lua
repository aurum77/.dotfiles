local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	return
end

require("lspconfig.ui.windows").default_options.border = "single"

local utils = require("core.utils")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "",
		},
		texthl = {
			[vim.diagnostic.severity.ERROR] = "Error",
			[vim.diagnostic.severity.WARN] = "Warn",
			[vim.diagnostic.severity.HINT] = "Hint",
			[vim.diagnostic.severity.INFO] = "Info",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
})

lspconfig.jsonls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.bashls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.tailwindcss.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.jedi_language_server.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.html.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.clangd.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.emmet_ls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
	filetypes = {
		"html",
	},
})

lspconfig.cssls.setup({
	capabilities = utils.capabilities,
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

lspconfig.ts_ls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
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

lspconfig.gopls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.dockerls.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})

lspconfig.docker_compose_language_service.setup({
	capabilities = utils.capabilities,
	on_attach = utils.on_attach,
})
