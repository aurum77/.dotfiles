require("gruvbox").setup({
	italic = false,
})

vim.cmd([[colorscheme gruvbox]])

local colors = require("core.colors").palette

vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.bg1, bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.ltorange })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = colors.fg0 })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.ltyellow, bold = true })
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { bg = colors.aqua, fg = colors.bg0, bold = true })
vim.api.nvim_set_hl(0, "LeapLabelSecondary", { bg = colors.blue, fg = colors.bg0, bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.bg1  })
vim.api.nvim_set_hl(0, "PMenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = colors.ltblue })

