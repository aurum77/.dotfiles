vim.pack.add({ "https://github.com/folke/trouble.nvim" })

vim.keymap.set("n", "<Leader>fa", "<Cmd>Trouble diagnostics toggle focus=true<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fd", "<Cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>", { silent = true })

local signs = {
	Error = " ",
	Warn = " ",
	Info = " ",
	Hint = " ",
}

local signConf = {
	text = {},
	texthl = {},
	numhl = {},
}

for type, icon in pairs(signs) do
	local severityName = string.upper(type)
	local severity = vim.diagnostic.severity[severityName]
	local hl = "DiagnosticSign" .. type
	signConf.text[severity] = icon
	signConf.texthl[severity] = hl
	signConf.numhl[severity] = hl
end

vim.diagnostic.config({
	signs = signConf,
})

require("trouble").setup({})
