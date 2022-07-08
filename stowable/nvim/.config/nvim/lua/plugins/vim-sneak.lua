vim.g["sneak#label"] = 1

local colors = require("gruvbox-baby.colors").config()

-- Change vim-sneak highlight color
vim.api.nvim_set_hl(0, "SneakLabel", { fg = colors.bright_yellow, bg = colors.medium_gray, bold = true })
