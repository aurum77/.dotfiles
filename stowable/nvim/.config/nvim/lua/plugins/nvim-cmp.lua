local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
	return
end

local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
				nvim_lsp_signature_help = "[Sign]",
				nvim_lua = "[API]",
			},
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),

		["<CR>"] = function(fallback)
			-- Don't block <CR> if signature help is active
			-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
			if
				not cmp.visible()
				or not cmp.get_selected_entry()
				or cmp.get_selected_entry().source.name == "nvim_lsp_signature_help"
			then
				fallback()
			else
				cmp.confirm({
					-- Replace word if completing in the middle of a word
					-- https://github.com/hrsh7th/nvim-cmp/issues/664
					behavior = cmp.ConfirmBehavior.Replace,
					-- Don't select first item on CR if nothing was selected
					select = false,
				})
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "emoji" },
	}),
})
