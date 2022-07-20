local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }

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
    fields = { "abbr", "kind", "menu" },
  },
  window = {
    completion = { cmp.config.window.bordered(), border = border },
    documentation = { cmp.config.window.bordered(), border = border },
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
