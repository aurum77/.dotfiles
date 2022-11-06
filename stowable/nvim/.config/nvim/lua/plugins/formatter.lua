local status_ok, formatter = pcall(require, "formatter")

if not status_ok then
	return
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		html = { require("formatter.filetypes.html").prettier },
		css = { require("formatter.filetypes.css").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescript").prettier },
		markdown = { require("formatter.filetypes.markdown").prettier },
		c = { require("formatter.filetypes.c").clangformat },
		jsonc = { require("formatter.filetypes.json").prettier },
		python = { require("formatter.filetypes.python").black },
		lua = { require("formatter.filetypes.lua").stylua },
		cs = { require("formatter.filetypes.cs").dotnetformat },
	},
})
