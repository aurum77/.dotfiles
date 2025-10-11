return {
	"neovim/nvim-lspconfig",
	init = function()
		local opts = require("plugins.lsp.opts").opts
		vim.keymap.set("n", "<Leader>lr", "<Cmd>LspRestart<CR>", opts)
		vim.keymap.set("n", "<Leader>li", "<Cmd>LspInfo<CR>", opts)
		vim.keymap.set("n", "<Leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, opts)
		vim.keymap.set("n", "<Leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)
	end,
	config = function()
		local lsp = require("plugins.lsp.utils").get_lsp()

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

		vim.lsp.enable(lsp)

		vim.lsp.config("*", {
			capabilities = lsp.capabilities,
		})
	end,
}
