return {
	"mhartington/formatter.nvim",
	init = function()
		local opts = require("plugins.lsp.opts").opts
		vim.keymap.set("n", "<C-f>", "<Cmd>Format<CR>", opts)
	end,
	cmd = "Format",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				c = { require("formatter.filetypes.c").clangformat },
				css = { require("formatter.filetypes.css").prettier },
				html = { require("formatter.filetypes.html").prettier },
				javascript = { require("formatter.filetypes.javascript").prettier },
				javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
				jsonc = { require("formatter.filetypes.json").prettier },
				json = { require("formatter.filetypes.json").prettier },
				lua = { require("formatter.filetypes.lua").stylua },
				markdown = { require("formatter.filetypes.markdown").prettier },
				python = { require("formatter.filetypes.python").black },
				sh = { require("formatter.filetypes.sh").shfmt },
				typescript = { require("formatter.filetypes.typescript").prettier },
				typescriptreact = { require("formatter.filetypes.typescript").prettier },
				dart = { require("formatter.filetypes.dart").dartformat },
				go = { require("formatter.filetypes.go").gofmt },
			},
		})
	end,
}
