return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		local cmp = require("cmp")
		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({ border = "single", winhighlight = "CursorLine:PmenuSel" }),
				documentation = cmp.config.window.bordered({ border = "single" }),
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						path = "[Path]",
						buffer = "[Buffer]",
						emoji = "[Emoji]",
						nvim_lsp_signature_help = "[Signature]",
						nvim_lua = "[API]",
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
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
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
	},
}
