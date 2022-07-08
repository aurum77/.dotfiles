local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local colors = require("gruvbox-baby.colors").config()

vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.bg, bg = colors.medium_gray })

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' },
  },

  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s ", kind_icons[vim_item.kind], vim_item.kind),

          vim_item.menu == ({
            nvim_lsp = "[lsp]",
            treesitter = "[treesitter]",
            luasnip = "[snip]",
            path = "[path]",
            buffer = "[buffer]",
          })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  }),
}
