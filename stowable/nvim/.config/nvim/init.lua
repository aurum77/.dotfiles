vim.loader.enable()

-- Core settings
require("core.options")
require("core.keymaps")
require("core.autocommands")
require("core.globals")

-- Lazy
require("lazy_init")
