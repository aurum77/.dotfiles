vim.opt.background = "dark"
vim.cmd [[colorscheme gruvbox-baby]]

local colors = require("gruvbox-baby.colors").config()

vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.medium_gray, bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = colors.medium_gray, bg = "NONE" })
vim.api.nvim_set_hl(0, "QuickFixLine", { fg = "NONE", bg = colors.medium_gray })
