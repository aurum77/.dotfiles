-- Packer
require("packer_init")

-- Plugin specific settings
require("plugins.lualine")
require("plugins.nvim-autopairs")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.treesitter-context")
require("plugins.indent-blankline")
require("plugins.markdown-preview")
require("plugins.mason")
require("plugins.mason-lspconfig")
require("plugins.mason-tool-installer")
require("plugins.nvim-cmp")
require("plugins.neodev")
require("plugins.lspconfig")
require("plugins.luasnip")
require("plugins.impatient")
require("plugins.telescope")
require("plugins.comment")
require("plugins.toggleterm")
require("plugins.nvim-web-devicons")
require("plugins.formatter")
require("plugins.rest")
require("plugins.nvim-surround")
require("plugins.gitsigns")
require("plugins.fidget")
require("plugins.live-server")
require("plugins.ccc")
require("plugins.trouble")
require("plugins.dressing")
require("plugins.gx")

-- Core settings
require("core.options")
require("core.theme")
require("core.keymaps")
require("core.autocommands")
require("core.globals")
