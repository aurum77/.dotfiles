local status_ok, formatter = pcall(require, "formatter")

if not status_ok then
	return
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		c = { require("formatter.filetypes.c").clangformat },
		cs = { require("formatter.filetypes.cs").dotnetformat },
		css = { require("formatter.filetypes.css").prettier },
		html = { require("formatter.filetypes.html").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		jsonc = { require("formatter.filetypes.json").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
		markdown = { require("formatter.filetypes.markdown").prettier },
		python = { require("formatter.filetypes.python").black },
		sh = { require("formatter.filetypes.sh").shfmt },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescript").prettier },
	},
})
