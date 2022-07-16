-- Packer
require("packer_init")

-- Plugin specific settings
require("plugins.nvim-web-devicons")
require("plugins.gruvbox-baby")
require("plugins.lualine")
require("plugins.nvim-autopairs")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.treesitter-context")
require("plugins.vim-sneak")
require("plugins.indent-blankline")
require("plugins.markdown-preview")
require("plugins.nvim-lsp-installer")
require("plugins.nvim-cmp")
require("plugins.lspconfig")
require("plugins.luasnip")
require("plugins.impatient")
require("plugins.telescope")
require("plugins.comment")
require("plugins.lspkind")

-- Core settings
require("core.options")
require("core.colorscheme")
require("core.keymaps")
require("core.autocommands")
