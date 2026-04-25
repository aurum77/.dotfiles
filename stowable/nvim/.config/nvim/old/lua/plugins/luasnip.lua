return {
	"L3MON4D3/LuaSnip",
	init = function()
		local ls = require("luasnip")
		vim.keymap.set({ "i" }, "<C-K>", function()
			ls.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip").filetype_extend("javascript", { "javascriptreact" })
		require("luasnip").filetype_extend("typescript", { "typecriptreact" })
	end,
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
}
