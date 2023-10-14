local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
	return
end

local lspkind = require("lspkind")
local luasnip = require("luasnip")

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({border = "rounded"}),
		documentation = cmp.config.window.bordered({border = "rounded"}),
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
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-s>"] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-i>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

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

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
